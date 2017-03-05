class Led < Board
  LED_PIN = 13.to_s
  def run
    if current_value.zero?
      update_board 1
    else
      update_board 0
    end
    ActionCable.server.broadcast 'sketch_channel', message: self.metadata
  end

  private

  def current_value
    self.metadata[LED_PIN].to_i
  end

  def update_board value
    self.update! metadata: { LED_PIN => value, type: "led" }
  end
end
