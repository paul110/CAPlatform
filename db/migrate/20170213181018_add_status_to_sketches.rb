class AddStatusToSketches < ActiveRecord::Migration[5.0]
  def change
    add_column :sketches, :status, :integer, default: 0
  end
end
