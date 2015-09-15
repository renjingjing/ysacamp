class AddColumnToClasstimetables < ActiveRecord::Migration
  def change
    add_column :classtimetables, :times_per_week, :integer
  end
end
