class MakeMacRequired < ActiveRecord::Migration[5.0]
  def change
    change_column :boards, :mac, :string, null: false
  end
end
