class SyncData < CodeRunner

  def run parent_board
    puts "BOARD IS: "
    puts board
    puts "PARENT BOARD is: "
    puts parent_board
    update_board parent_board.metadata
  end

  private

  def update_board new_metadata
    board.update! metadata: new_metadata
  end

end
