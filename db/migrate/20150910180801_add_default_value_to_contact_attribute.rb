class AddDefaultValueToContactAttribute < ActiveRecord::Migration
  def up
  change_column_default :contacts, :done, false
  end

  def down
    change_column_default :contacts, :done, nil
  end
end
