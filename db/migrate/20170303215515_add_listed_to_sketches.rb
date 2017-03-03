class AddListedToSketches < ActiveRecord::Migration[5.0]
  def change
    add_column :sketches, :listed, :boolean, default: false
  end
end
