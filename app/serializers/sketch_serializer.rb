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
#  status       :integer          default("pending")
#

class SketchSerializer < ActiveModel::Serializer
  attributes :id, :links, :boards, :status

  def boards
    object.boards.each do |board|
      next unless b = Board.find_by(mac: board["mac"])
      board["boardConfig"] = BoardSerializer.new b
    end
  end
end
