# == Schema Information
#
# Table name: boards
#
#  id              :integer          not null, primary key
#  mac             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  status          :integer          default("offline")
#  metadata        :jsonb
#  last_active     :datetime
#  name            :string           default("")
#  maintype        :string
#  type            :string
#  accepted_links  :jsonb
#  register_status :integer          default("unregistered")
#  user_id         :integer
#

class Lcd < Board

  def get_methods
    {
      hello: "Display hello world",
      buna: "Display buna dimineata",
      run: "Display articles"
    }
  end

  def run
    data = ExternalDatum.first.data
    index = (self.metadata.dig('id').to_i + 1 < data.length) ? metadata.dig('id').to_i + 1 : 0
    update_board data.dig(index, 'title'), data.dig(index, 'href'), index
    sync_data
    broadcast
  end

  def hello
    update! metadata: { type: 'lcd_display', value: "hello world", id: 1, href: "www.google.com"}
    broadcast
  end

  def buna
    update! metadata: { type: 'lcd_display', value: "buna dimineata", id: 1, href: "www.google.com" }
    broadcast
  end

  def update_board value, href, id
    update! metadata: { type: 'lcd_display', value: value, id: id, href: href}
  end

end
