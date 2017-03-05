class Input < Board
  def run
    sketch = find_sketch self.mac
    links = find_boards self.mac, sketch, key: 'from'
    links.each do |link|
      b = Board.find_by mac: link['to']
      b.run
    end
    ActionCable.server.broadcast 'sketch_channel', message: self.metadata
  end

end
