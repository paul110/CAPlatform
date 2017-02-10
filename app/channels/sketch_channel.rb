class SketchChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sketch_channel"
    Rails.logger.warn Board.find_by(uid: params[:mac])
  end

  def unsubscribed
    Rails.logger.warn Board.find_by(uid: params[:mac])
  end

  def blink data
    InputBroadcastJob.perform_now data
  end
end
