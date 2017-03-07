class SketchChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sketch_channel"
    if board = Board.find_or_create_by(mac: params[:mac])
      Log.connect(board.name, board.mac)
      board.update status: "online"
    end
  end

  def unsubscribed
    if board = Board.find_by(mac: params[:mac])
      Log.disconnect(board.name, board.mac)
      board.update status: "offline"
    end
  end

  def blink data
    if board = Board.find_by(mac: params[:mac])
      Log.received "Received input from #{board.name}<#{board.mac}>"
      InputBroadcastJob.perform_now data, board
    end
  end
end
