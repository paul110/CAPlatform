class AddStatusToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :status, :integer, default: 0
  end
end
