class LogSerializer < ActiveModel::Serializer
  attributes :log_type, :message, :created_at, :id

  def created_at
    object.created_at.to_s(:short)
  end
end
