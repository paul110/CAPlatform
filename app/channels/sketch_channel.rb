class SketchChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sketch_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def blink data
    ActionCable.server.broadcast 'sketch_channel', message: data['message']
  end
end
