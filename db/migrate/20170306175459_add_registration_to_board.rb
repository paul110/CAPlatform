class AddRegistrationToBoard < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :register_status, :integer, default: 0
  end
end
