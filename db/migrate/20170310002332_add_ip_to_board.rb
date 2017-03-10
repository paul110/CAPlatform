class AddIpToBoard < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :ip, :string
  end
end
