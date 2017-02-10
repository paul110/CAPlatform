# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  uid        :string
#  button     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default("0")
#

require 'rails_helper'

RSpec.describe Board, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
