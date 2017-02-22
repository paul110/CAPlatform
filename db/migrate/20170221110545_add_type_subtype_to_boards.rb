class AddTypeSubtypeToBoards < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :maintype, :string
    add_column :boards, :subtype, :string
  end
end
