# == Schema Information
#
# Table name: boards
#
#  id              :integer          not null, primary key
#  mac             :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  status          :integer          default("offline")
#  metadata        :jsonb
#  name            :string           default("")
#  last_active     :datetime
#  type            :string
#  accepted_links  :jsonb
#  register_status :integer          default("unregistered")
#  user_id         :integer
#  ip              :string
#

class Input < Board

  def get_methods
    { run: "activate" }
  end

  def run
    sketch = find_sketch
    links = find_boards sketch, key: 'from'
    links.each do |link|
      b = Board.find_by mac: link['to']
      BoardActionJob.perform_now b, link['logic']
    end
    super
  end
end
