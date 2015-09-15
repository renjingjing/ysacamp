class CreateCourseandunits < ActiveRecord::Migration
  def change
    create_table :courseandunits do |t|
      t.references :course_unit, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
