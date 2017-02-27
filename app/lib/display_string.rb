class DisplayString < CodeRunner
  def run parent_board
    data = ExternalDatum.first.data
    index = (board.metadata.dig('id').to_i + 1 < data.length) ? board.metadata.dig('id').to_i + 1 : 0
    update_board data.dig(index, 'title'), data.dig(index, 'href'), index
    super
  end

  private

  def update_board value, href, id
    board.update! metadata: { type: 'lcd_display', value: value, id: id, href: href}
  end

end
