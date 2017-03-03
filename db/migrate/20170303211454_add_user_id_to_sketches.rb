class AddUserIdToSketches < ActiveRecord::Migration[5.0]
  def change
    add_column :sketches, :user_id, :integer
    add_column :sketches, :creator_id, :integer
  end
end
