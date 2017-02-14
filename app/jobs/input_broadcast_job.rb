class InputBroadcastJob < ApplicationJob
  queue_as :default

  def perform data, board
    CodeRunner.execute_flow board
  end
end
