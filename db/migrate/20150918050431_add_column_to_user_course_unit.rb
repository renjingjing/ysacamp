class AddColumnToUserCourseUnit < ActiveRecord::Migration
  def change
    add_column :user_course_units, :date_enrollment, :datetime
  end
end
