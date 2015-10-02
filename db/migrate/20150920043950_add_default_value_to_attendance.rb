class AddDefaultValueToAttendance < ActiveRecord::Migration

  def up
  change_column_default :attendances, :finished, false
  end

  def down
    change_column_default :attendances, :finished, nil
  end
end
