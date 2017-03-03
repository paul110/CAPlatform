class AddNameToSketch < ActiveRecord::Migration[5.0]
  def change
    add_column :sketches, :name, :string, default: ""
  end
end
