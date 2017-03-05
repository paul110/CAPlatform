class Screen < Board
  def run
    super
  end

  def sync board
    self.update! metadata: { type: "link_opener", url: board.metadata.dig('href') }
  end
end
