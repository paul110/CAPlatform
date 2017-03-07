# == Schema Information
#
# Table name: boards
#
#  id              :integer          not null, primary key
#  mac             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  status          :integer          default("offline")
#  metadata        :jsonb
#  last_active     :datetime
#  name            :string           default("")
#  maintype        :string
#  subtype         :string
#  accepted_links  :jsonb
#  register_status :integer          default("unregistered")
#  user_id         :integer
#

class BoardSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :mac, :status, :name, :last_activity, :maintype, :subtype, :accepted_links

  def last_activity
    "#{distance_of_time_in_words(Time.now, object.last_active, include_seconds: true)} ago"
  end
end
