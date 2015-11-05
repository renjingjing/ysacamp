class Courseandunit < ActiveRecord::Base
  belongs_to :course_unit
  belongs_to :course
end
