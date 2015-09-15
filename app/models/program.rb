class Program < ActiveRecord::Base
  has_many   :programeds, dependent: :destroy
  has_many   :courses, through: :programeds

  validates  :program_name, uniqueness:true, presence: true

  def self.search(program)
    search_term = "%#{program}%"
    where(["program_name ILIKE :term OR description ILIKE :term", {term: search_term}])
  end

  def has_courses(program_id)
    Programed.find program_id
  end

end
