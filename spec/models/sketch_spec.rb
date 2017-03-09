# == Schema Information
#
# Table name: sketches
#
#  id           :integer          not null, primary key
#  links        :jsonb            not null
#  boards       :jsonb            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  published_at :datetime
#  trashed_at   :datetime
#  status       :integer          default("closed")
#  name         :string           default("")
#  user_id      :integer
#  creator_id   :integer
#  listed       :boolean          default(FALSE)
#  description  :string           default("")
#

require 'rails_helper'

RSpec.describe Sketch, type: :model do
  let!(:sketch1) { create(:sketch, status: "closed") }
  let!(:sketch2) { create(:sketch, status: "active") }

  describe "only one active sketch" do
    it "disables the other active sketch" do
      sketch1.update!(status: "active")

      expect(sketch1.reload.status).to eq "active"
      expect(sketch2.reload.status).to eq "closed"
    end
  end
end
