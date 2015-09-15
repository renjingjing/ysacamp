class CreateUserCourseUnits < ActiveRecord::Migration
  def change
    create_table :user_course_units do |t|
      t.references :course_unit, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
