class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.integer :log_type
      t.string :message

      t.timestamps
    end
  end
end
