class AddDefaultValueToUserCourseUnit < ActiveRecord::Migration
    def up
    change_column_default :user_course_units, :finish, false
    end

    def down
      change_column_default :user_course_units, :finish, nil
    end
end
