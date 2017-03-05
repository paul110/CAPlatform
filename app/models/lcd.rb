class Lcd < Board
  def run
    ActionCable.server.broadcast 'sketch_channel', message: self.metadata
  end
end
