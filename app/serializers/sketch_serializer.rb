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
#

class SketchSerializer < ActiveModel::Serializer
  attributes :id, :links, :boards, :status, :name, :user, :creator, :user_id, :creator_id, :listed, :description

  def boards
    object.boards.each do |board|
      next unless b = Board.find_by(mac: board["mac"])
      board["boardConfig"] = BoardSerializer.new b
    end
  end

  def user
    return "" unless object.user
    "#{object.user.name}<#{object.user.email}>"
  end

  def creator
    return "" unless object.creator
    "#{object.creator.name}<#{object.creator.email}>"
  end
end
