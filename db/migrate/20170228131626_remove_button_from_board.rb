class RemoveButtonFromBoard < ActiveRecord::Migration[5.0]
  def change
    remove_column :boards, :button
  end
end
