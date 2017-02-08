class CreateSketches < ActiveRecord::Migration[5.0]
  def change
    create_table :sketches do |t|
      t.jsonb :links, null: false, default: '[]'
      t.jsonb :boards, null: false, default: '[]'
      t.timestamps
    end
  end
end
