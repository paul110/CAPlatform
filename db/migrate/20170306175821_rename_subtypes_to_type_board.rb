class RenameSubtypesToTypeBoard < ActiveRecord::Migration[5.0]
  def change
    rename_column :boards, :subtype, :type
  end
end
