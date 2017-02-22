# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  mac        :string
#  button     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default("offline")
#  metadata   :jsonb
#  name       :string           default("")
#  maintype   :string
#  subtype    :string
#

class BoardSerializer < ActiveModel::Serializer
  attributes :id, :mac, :button, :status, :name, :maintype, :subtype
end
