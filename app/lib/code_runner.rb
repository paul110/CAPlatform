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
    update_boards before_links, option_hooks: BEFORE_HOOKS, key: 'from'

    boards_to_update = find_boards board.mac, sketch, key: 'from'
    update_boards boards_to_update
  end


  def initialize mac, link: {}
    @board = Board.find_by(mac: mac) or raise "Board Not Found mac: #{mac}"
  end

  def run
    notify_board
  end


  private

  def self.inspect_links links
    before_links = []
    after_links = []
    links.each do |link|
      option = link['logic'].to_sym
      if BEFORE_HOOKS[option]
        before_links.push link
      elsif AFTER_HOOKS[option]
        after_links.push link
      else
        raise "Option #{option} not found"
      end
    end
    return before_links, after_links
  end

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

  def self.update_boards boards_to_update, option_hooks: AFTER_HOOKS, key: 'to'
    # before_links, after_links = self.inspect_links boards_to_update

    boards_to_update.each do |link|
      option = link["logic"].to_sym
      raise "Option #{option} not found" unless option_hooks[option]
      option_hooks[option].constantize.new(link[key], link: link).run
    end
    # after_links.each do |link|
    #   option = link["logic"].to_sym
    #   raise "Option #{option} not found" unless AFTER_HOOKS[option]
    #   AFTER_HOOKS[option].constantize.new(link["to"]).run
    # end
  end

end
