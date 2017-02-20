class CreateExternalData < ActiveRecord::Migration[5.0]
  def change
    create_table :external_data do |t|
      t.integer :source_type
      t.jsonb :data
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
