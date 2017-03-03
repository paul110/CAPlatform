class AddAcceptedLinksToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :accepted_links, :jsonb, default: {}
  end
end
