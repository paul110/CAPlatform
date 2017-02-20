class AddLastActiveToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :last_active, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
