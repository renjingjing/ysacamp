class CreateCourseUnits < ActiveRecord::Migration
  def change
    create_table :course_units do |t|
      t.string :title
      t.text :description
      t.string :note

      t.timestamps null: false
    end
  end
end
