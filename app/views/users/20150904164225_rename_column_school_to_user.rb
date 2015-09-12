class RenameColumnSchoolToUser < ActiveRecord::Migration
  def change
    rename_column :users, :school, :class
  end
end
