class Toggle < CodeRunner
  LED_PIN = 13.to_s

  def run
    if current_value.zero?
      update_board 1
    else
      update_board 0
    end
    super
  end

  private

  def current_value
    board.metadata[LED_PIN].to_i
  end

  def update_board value
    board.update! metadata: { LED_PIN => value }
  end

end
