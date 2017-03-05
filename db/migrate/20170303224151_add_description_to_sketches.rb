class AddDescriptionToSketches < ActiveRecord::Migration[5.0]
  def change
    add_column :sketches, :description, :string, default: ""
  end
end
