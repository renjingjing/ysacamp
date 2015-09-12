class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :course_name
      t.string :level
      t.string :class_amount
      t.string :time_info
      t.string :description
      t.string :max_students

      t.timestamps null: false
    end
  end
end
