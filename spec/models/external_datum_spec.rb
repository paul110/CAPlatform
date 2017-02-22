# == Schema Information
#
# Table name: external_data
#
#  id          :integer          not null, primary key
#  source_type :integer
#  data        :jsonb
#  name        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe ExternalDatum, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
