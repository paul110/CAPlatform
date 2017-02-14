class AddObjectChangesToDrafts < ActiveRecord::Migration[5.0]
  def change
    add_column :drafts, :object_changes, :text
  end
end
