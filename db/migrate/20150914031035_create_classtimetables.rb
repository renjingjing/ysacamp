class CreateClasstimetables < ActiveRecord::Migration
  def change
    create_table :classtimetables do |t|
      t.time :start_time
      t.time :end_time
      t.datetime :day
      t.string :weekday
      t.string :month
      t.string :year

      t.timestamps null: false
    end
  end
end
