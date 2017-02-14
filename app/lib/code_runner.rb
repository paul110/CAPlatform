class CodeRunner
  attr_accessor :sketch, :boards_to_update

  OPTIONS = {
    toggle: Toggle
  }

  def initialize board
    @sketch = find_sketch board.mac
    @boards_to_update = find_boards board.mac, sketch
  end

  def run
    boards_to_update.each do |link|
      option = link["logic"].to_sym
      raise "Option not found" unless OPTIONS[option]
      OPTIONS[option].new(link["to"]).run
    end
  end

  private

  def find_sketch mac
    # There should be no problem interpolating here because the mac is a db value
    Sketch
      .where("boards @> '[{\"mac\":\"#{mac}\"}]'")
      .where(status: :active)
      .take
  end

  def find_boards mac, sketch
    sketch.links.select{ |l| l["from"] == mac }
  end

end
