class BoardSerializer < ActiveModel::Serializer
  attributes :id, :mac, :button, :status, :name
end
