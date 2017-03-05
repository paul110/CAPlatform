class InputBroadcastJob < ApplicationJob
  queue_as :default

  def perform data, board
    board.run
    # CodeRunner.execute_flow board
  end
end
