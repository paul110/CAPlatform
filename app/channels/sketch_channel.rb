class SketchChannel < ApplicationCable::Channel
  CHANNEL_NAME = "SketchChannel"
  def subscribed
    stream_from "sketch_channel#{params[:mac]}"
    if board = Board.find_or_create_by(mac: params[:mac], type: params[:type])
      if board.valid?
        Log.connect(board.name, board.mac, CHANNEL_NAME)
      else
        Log.error "Invalid Board params(#{params.inspect}) #{board.mac}"
      end
      board.update status: "online"
    end
  end

  def unsubscribed
    if board = Board.find_by(mac: params[:mac])
      Log.disconnect(board.name, board.mac, CHANNEL_NAME)
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
