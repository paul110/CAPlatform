# == Schema Information
#
# Table name: logs
#
#  id         :integer          not null, primary key
#  log_type   :integer
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Log < ApplicationRecord
  CHANNEL = 'log_channel'

  enum log_type: {
    error: 0,
    connected: 1,
    disconnected: 2
  }

  scope :latest_logs, -> {
    ids = order("id desc").limit(10)
    where(id: ids)
  }

  def self.send_latest
    ActionCable.server.broadcast 'log_channel', message: serialize_logs
  end

  def self.record_connection board_name, board_mac
    create! log_type: "connected", message: "Board: #{board_name}<#{board_mac}> connected to the channel."
  end

  def self.record_disconnect board_name, board_mac
    create! log_type: "disconnected", message: "Board: #{board_name}<#{board_mac}> disconnected from the channel."
  end

  private

  def self.serialize_logs
    latest_logs.map do |log|
      LogSerializer.new(log).as_json
    end
  end
end
