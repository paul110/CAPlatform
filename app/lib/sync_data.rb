class SyncData < CodeRunner
  attr_accessor :sync_from
  def initialize mac, link: {}
    super mac
    raise "SyncData requires a board link as a parameter" unless link.dig(:from)
    @sync_from = Board.find_by(mac: link[:from]) or raise "Board Not Found mac: #{link[:from]}"
  end

  def run
    update_board @sync_from.metadata
  end

  private

  def update_board new_metadata
    @board.update! metadata: new_metadata
  end

end
