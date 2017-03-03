class AddUserIdToSketches < ActiveRecord::Migration[5.0]
  def change
    add_column :sketches, :user_id, :integer
    add_column :sketches, :purchased_from_id, :integer
    add_index :sketches, :user_id
    add_index :sketches, :purchased_from_id
  end
end
