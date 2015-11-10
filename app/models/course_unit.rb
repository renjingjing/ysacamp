class CourseUnit < ActiveRecord::Base
  belongs_to :course

  #keep attendances record except user was deleted from db
  has_many  :attendances,dependent: :destroy
  has_many  :registed_users, through: :attendances,source: :user
  has_many  :classtimetables,dependent: :nullify

  def self.search( course_unit )
    search_term = "%#{course_unit}%"
    where(["title ILIKE :term OR description ILIKE :term", {term: search_term}])
  end

  def get_regitsted_users( course_unit )
    users ||= Attendances.find course_unit
  end

  def self.units_course( course_unit )
    Course.find course_unit.course_id
  end

end
