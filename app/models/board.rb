# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  mac         :string
#  button      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default("0")
#  metadata    :jsonb            default("{}")
#  last_active :datetime
#

class Board < ApplicationRecord
  enum status: {
    offline: 0,
    online: 1
  }
end
