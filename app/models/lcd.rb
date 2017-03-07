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

class Lcd < Board

  def get_methods
    {
      sync_data: "display text",
      hello: "Display hello world",
      buna: "Display buna dimineata",
      run: "Display articles"
    }
  end

  def run
    broadcast
  end

  def sync board
    update_board board.metadata.dig("value")
  end

  def hello
    update_board "hello world"
  end

  def buna
    update_board "buna dimineata"
  end

  def update_board value
    update! metadata: { type: 'lcd_display', value: value }
    broadcast
  end

end
