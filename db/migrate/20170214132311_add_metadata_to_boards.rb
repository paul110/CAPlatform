class AddMetadataToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :metadata, :jsonb, default: {}
  end
end
