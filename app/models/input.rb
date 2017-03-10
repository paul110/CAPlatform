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
    { run: "default method" }
  end

  def run
    sketch = find_sketch
    links = find_boards sketch, key: 'from'
    links.each do |link|
      b = Board.find_by mac: link['to']
      logger.debug "Running #{link['logic']} for #{b.name} #{b.mac}"
      if b.get_methods.has_key?(link["logic"].to_sym)
        b.public_send(link["logic"])
      else
        logger.debug "Board #{b.mac} doesn't support logic #{link['logic']}"
        Log.error "Board #{b.name}<#{b.mac}> doesn't support logic #{link['logic']}"
      end
    end
    super
  end
end
