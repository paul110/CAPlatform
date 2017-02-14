class InputBroadcastJob < ApplicationJob
  queue_as :default

  def perform data, board
    CodeRunner.new(board).run
  end
end
