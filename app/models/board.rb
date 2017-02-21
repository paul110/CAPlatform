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

class Board < ApplicationRecord
  enum status: {
    offline: 0,
    online: 1
  }
end
