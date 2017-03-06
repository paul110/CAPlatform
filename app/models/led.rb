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

class Led < Board
  LED_PIN = 13.to_s
  def get_methods
    { run: "default method" }
  end

  def run
    if current_value.zero?
      update_board 1
    else
      update_board 0
    end
    super
  end

  private

  def current_value
    self.metadata[LED_PIN].to_i
  end

  def update_board value
    self.update! metadata: { LED_PIN => value, type: "led" }
  end
end
