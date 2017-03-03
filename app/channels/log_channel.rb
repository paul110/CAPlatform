class LogChannel < ApplicationCable::Channel
  def subscribed
    stream_from Log::CHANNEL
    Log.send_latest
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update
  end
end
