class BoardSerializer < ActiveModel::Serializer
  attributes :id, :uid, :button, :status
end
