class CodeRunner
  attr_accessor :board

  # Map of references to code logic options
  BEFORE_HOOKS = {
    sync_data: "SyncData"
  }.freeze

  AFTER_HOOKS = {
    toggle: "Toggle",
    display_string: "DisplayString",
    link_opener: "LinkOpener"
  }.freeze

  def self.execute_flow board
    sketch = find_sketch board.mac
    before_links = find_boards board.mac, sketch, key: 'to'
    update_boards before_links, option_hooks: BEFORE_HOOKS
    after_links = find_boards board.mac, sketch, key: 'from'
    update_boards after_links, option_hooks: AFTER_HOOKS
  end


  def initialize mac
    @board = Board.find_by(mac: mac) or raise "Board Not Found mac: #{mac}"
  end

  def run parent_board
    notify_board
  end


  private

  def notify_board
    ActionCable.server.broadcast 'sketch_channel', message: board.metadata
  end

  def self.find_sketch mac
    # There should be no problem interpolating here because the mac is a db value
    Sketch
      .where("boards @> '[{\"mac\":\"#{mac}\"}]'")
      .where(status: :active)
      .first or raise "Couldn't find active sketch for #{mac}"
  end

  def self.find_boards mac, sketch, key: "from"
    sketch.links.select{ |l| l[key] == mac }
  end

  def self.update_boards boards_to_update, option_hooks: AFTER_HOOKS
    boards_to_update.each do |link|
      option = link["logic"].to_sym
      raise "Option #{option} not found" unless option_hooks[option]
      case option_hooks
      when AFTER_HOOKS
        option_hooks[option].constantize.new(link['to']).run @board
      when BEFORE_HOOKS
        # binding.pry
        option_hooks[option].constantize.new(link['from']).run @board
      else
      end
    end
  end

end
