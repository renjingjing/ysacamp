class Program < ActiveRecord::Base
  def self.search(program)
    search_term = "%#{program}%"
    where(["course_name ILIKE :term OR level ILIKE :term OR class_amount ILIKE :term", {term: search_term}])
  end
end
