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

class LogSerializer < ActiveModel::Serializer
  attributes :log_type, :message, :created_at, :id

  def created_at
    object.created_at.strftime("%H:%M:%S.%L")
  end
end
