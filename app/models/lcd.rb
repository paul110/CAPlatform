class Lcd < Board
  def run
    data = ExternalDatum.first.data
    index = (self.metadata.dig('id').to_i + 1 < data.length) ? self.metadata.dig('id').to_i + 1 : 0
    update_board data.dig(index, 'title'), data.dig(index, 'href'), index
    super
  end

  def update_board value, href, id
    self.update! metadata: { type: 'lcd_display', value: value, id: id, href: href}
  end
end
