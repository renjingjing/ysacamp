class CourseUnit < ActiveRecord::Base
  has_many  :courseandunits,dependent: :destroy
  has_many  :courses,through: :courseandunits

  has_many  :user_course_units, dependent: :nullify
  has_many  :registed_users, through: :user_course_units, source: :user

  def self.search(course_unit)
    search_term = "%#{course_unit}%"
    where(["title ILIKE :term OR description ILIKE :term", {term: search_term}])
  end

  def has_regitsted_users(course_id)
    User_course_units.find course_id
  end

  def self.units_course(course_unit)
    Course.find course_unit.course_id
  end

end
