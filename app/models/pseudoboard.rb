class Pseudoboard < Board

  def get_methods
    {
      next: "change article"
    }
  end

  def next
    data = ExternalDatum.first.data
    index = (self.metadata.dig('id').to_i + 1 < data.length) ? metadata.dig('id').to_i + 1 : 0
    update_board data.dig(index, 'title'), data.dig(index, 'href'), index
    sync_data
  end

  def update_board value, href, id
    update! metadata: { value: value, id: id, href: href }
  end

end
