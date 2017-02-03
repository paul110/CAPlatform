class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.string :uid
      t.boolean :button

      t.timestamps
    end
  end
end
