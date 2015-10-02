class Course < ActiveRecord::Base
  has_many    :programeds, dependent: :destroy
  has_many    :programs, through: :programeds
  has_many    :course_units, dependent: :nullify

  validates   :title, presence: true

  def self.search( course )
    search_term = "%#{course}%"
    where( ["name ILIKE :term OR description ILIKE :term", {term: search_term}] )
  end

  def has_course_units( course_id )
    Courseandunit.find course_id
  end

  def has_those_units( course_unit )
    Course.find course_unit
  end

end
