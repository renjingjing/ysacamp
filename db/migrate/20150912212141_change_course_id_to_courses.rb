class ChangeCourseIdToCourses < ActiveRecord::Migration
  def change
    def up
    change_column_name :courses, :course_unit_id, index: true, foreign_key: true
    end

    def down
    change_column_name :courses, :course_id
    end
  end
end
