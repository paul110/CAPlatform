class DisplayString < CodeRunner
  def run
    update_board "Hello world! Hello world!"
    super
  end

  private

  def update_board value
    board.update! metadata: { type: "lcd_display", value: value}
  end

end