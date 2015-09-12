class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :registration_time, :datetime
  end
end
