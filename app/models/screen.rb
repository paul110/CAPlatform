# == Schema Information
#
# Table name: boards
#
#  id             :integer          not null, primary key
#  mac            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  status         :integer          default("offline")
#  metadata       :jsonb
#  name           :string           default("")
#  last_active    :datetime
#  maintype       :string
#  type           :string
#  accepted_links :jsonb
#

class Screen < Board

  def get_methods
    {
      run: "default method",
      sync_data: "synchronize url"
    }
  end

  def run
    broadcast
  end

  def sync board
    update! metadata: { type: "link_opener", url: board.metadata.dig('href') }
  end
end
