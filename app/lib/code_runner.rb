class CodeRunner
  attr_accessor :board

  # Map of references to code logic options
  BEFORE_HOOKS = {
    sync_data: "Synchronise data between devices"
  }.freeze

  AFTER_HOOKS = {
    toggle: "Flip the value between on and off",
    display_string: "Print a string to the LCD",
    link_opener: "Open an url on the Laptop peripheral",
    sync_data: "Synchronise data between devices"
  }.freeze

  def self.execute_flow board
    sketch = find_sketch board.mac
    before_links = find_boards board.mac, sketch, key: 'to'
    update_boards links: before_links, option_hooks: BEFORE_HOOKS, parent_board: board
    board.reload
    after_links = find_boards board.mac, sketch, key: 'from'
    update_boards links: after_links, option_hooks: AFTER_HOOKS, parent_board: board
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

  def self.update_boards links: {}, option_hooks: AFTER_HOOKS, parent_board: nil
    raise "No parent board provided" if parent_board.nil?
    links.each do |link|
      option = link["logic"].to_sym
      raise "Option #{option} not found" unless option_hooks.has_key?(option)
      klass = option.to_s.camelize.constantize
      case option_hooks
      when BEFORE_HOOKS
        klass.new(link['to']).run Board.find_by mac: link['from']
      when AFTER_HOOKS
        klass.new(link['to']).run parent_board
      else
      end
    end
  end

end
