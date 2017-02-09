class AddDraftsToSketches < ActiveRecord::Migration[5.0]
  def change
    add_column :sketches, :draft_id, :integer
    add_column :sketches, :published_at, :timestamp
    add_column :sketches, :trashed_at, :timestamp
  end
end
