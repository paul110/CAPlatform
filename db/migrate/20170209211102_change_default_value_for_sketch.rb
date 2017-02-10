class ChangeDefaultValueForSketch < ActiveRecord::Migration[5.0]
  def up
    change_column :sketches, :boards, :jsonb, default: []
    change_column :sketches, :links, :jsonb, default: []
    Sketch.delete_all
  end

  def down
    change_column :sketches, :boards, :jsonb, default: '[]'
    change_column :sketches, :links, :jsonb, default: '[]'
    Sketch.delete_all
  end
end
