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

class Input < Board
  def get_methods
    { run: "default method" }
  end

  def run
    sketch = find_sketch self.mac
    links = find_boards self.mac, sketch, key: 'from'
    links.each do |link|
      b = Board.find_by mac: link['to']
      b.send(link["logic"])
      puts b
    end
    super
  end
end
