class BoardSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :mac, :button, :status, :last_activity

  def last_activity
    "#{distance_of_time_in_words(Time.now, object.last_active, include_seconds: true)} ago"
  end
end
