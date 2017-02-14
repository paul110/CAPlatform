class ChangeBoardUidToMac < ActiveRecord::Migration[5.0]
  rename_column :boards, :uid, :mac
end
