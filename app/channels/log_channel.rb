class LogChannel < ApplicationCable::Channel
  def subscribed
  stream_from "log_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update
  end
end
