class CreateClasstimetables < ActiveRecord::Migration
  def change
    create_table :classtimetables do |t|
      t.time :start_time
      t.time :end_time
      t.datetime :star_day
      t.datetime :end_day
      t.string :weekday
      t.string :month
      t.integer :times_per_week

      t.timestamps null: false
    end
  end
end
