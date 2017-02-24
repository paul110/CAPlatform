class RemoveDraftIdFromSketch < ActiveRecord::Migration[5.0]
  def change
    remove_column :sketches, :draft_id
  end
end
