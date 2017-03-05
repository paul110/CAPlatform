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
#  subtype        :string
#  accepted_links :jsonb
#

class Lcd < Board
  def run
    data = ExternalDatum.first.data
    index = (self.metadata.dig('id').to_i + 1 < data.length) ? self.metadata.dig('id').to_i + 1 : 0
    update_board data.dig(index, 'title'), data.dig(index, 'href'), index
    super
  end

  def update_board value, href, id
    self.update! metadata: { type: 'lcd_display', value: value, id: id, href: href}
  end
end
