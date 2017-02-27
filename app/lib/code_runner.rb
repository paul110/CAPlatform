class CodeRunner
  attr_accessor :board

  # Map of references to code logic options
  OPTIONS = {
    toggle: "Toggle",
    display_string: "DisplayString",
    link_opener: "LinkOpener"
  }.freeze

  def self.execute_flow board
    sketch = find_sketch board.mac
    boards_to_update = find_boards board.mac, sketch
    update_boards boards_to_update
  end

  def self.configure_sketch sketch_id
    links = self.links_to_configure sketch_id
    links.each do |link|
      option = link[:logic].to_sym
      raise "Option #{option} not found" unless OPTIONS[option]
      OPTIONS[option].constantize.new(link[:board]).configure_board
    end
  end

  def initialize mac
    @board = Board.find_by(mac: mac) or raise "Board Not Found mac: #{mac}"
  end

  def run
    notify_board
  end

  def configure_board
  end

  private

  def self.links_to_configure sketch_id
    Sketch
      .find(sketch_id)
      .links
      .map{ |link| { logic: link["logic"], mac: link["to"] } }
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

  def self.find_boards mac, sketch
    sketch.links.select{ |l| l["from"] == mac }
  end

  def self.update_boards boards_to_update
    boards_to_update.each do |link|
      option = link["logic"].to_sym
      raise "Option #{option} not found" unless OPTIONS[option]
      OPTIONS[option].constantize.new(link["to"]).run
    end
  end

end
