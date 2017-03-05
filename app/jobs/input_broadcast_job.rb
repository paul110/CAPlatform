class InputBroadcastJob < ApplicationJob
  queue_as :default

  def perform data, board
    board.run
    board.sync_data
  end
end
