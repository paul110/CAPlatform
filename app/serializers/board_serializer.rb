# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  mac         :string
#  button      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default("offline")
#  metadata    :jsonb
#  last_active :datetime
#  name        :string           default("")
#  maintype    :string
#  subtype     :string
#

class BoardSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :mac, :button, :status, :name, :last_activity, :maintype, :subtype

  def last_activity
    "#{distance_of_time_in_words(Time.now, object.last_active, include_seconds: true)} ago"
  end
end
