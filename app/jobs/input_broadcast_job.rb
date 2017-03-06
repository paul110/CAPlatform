class InputBroadcastJob < ApplicationJob
  queue_as :default

  def perform data, board
    board.run
  end
end
