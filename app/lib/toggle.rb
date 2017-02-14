class Toggle < CodeRunner
  LED_PIN = 13.to_s

  attr_accessor :board

  def initialize mac
    @board = Board.find_by(mac: mac) or raise "Board Not Found mac: #{mac}"
  end

  def run
    if current_value.zero?
      update_board 1
    else
      update_board 0
    end
    notify_board
  end

  private

  def notify_board
    ActionCable.server.broadcast 'sketch_channel', message: board.metadata
  end

  def current_value
    board.metadata[LED_PIN].to_i
  end

  def update_board value
    board.update! metadata: { LED_PIN => value }
  end

end
