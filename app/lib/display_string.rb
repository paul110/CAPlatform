class DisplayString < CodeRunner
  def run
    data = ExternalDatum.first.data
    index = (board.metadata.dig('id').to_i + 1 < data.length) ? board.metadata.dig('id').to_i + 1 : 0
    update_board data.dig(index, 'title'), index
    super
  end

  def configure_board
    update_board ExternalDatum.first.data.first['title'], 0
    super
  end

  private

  def update_board value, id
    board.update! metadata: { type: 'lcd_display', value: value, id: id}
  end

end
