class SketchSerializer < ActiveModel::Serializer
  attributes :id, :links, :boards, :status
end
