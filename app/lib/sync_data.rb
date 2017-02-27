class SyncData < CodeRunner
  attr_accessor :sync_from

  def run parent_board
    update_board parent_board.metadata
  end

  private

  def update_board new_metadata
    @board.update! metadata: new_metadata
  end

end
