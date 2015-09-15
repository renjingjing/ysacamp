class UserCourseUnit < ActiveRecord::Base
  belongs_to :course_unit
  belongs_to :user
end
