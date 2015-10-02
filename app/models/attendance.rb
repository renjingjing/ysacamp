class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :course_unit

  belongs_to   :classtimetable

  def self.recent
    order( :created_at ).reverse_order
  end

  def self.ten
    limit( 10 )
  end

  def self.recent_ten
    recent.ten
  end

  def self.search( item )
    # thing = "%#{item}%"
    # where( ["title ILIKE ? OR body ILIKE ?", thing, thing] )
    search_term = "%#{item}%"
    # where( "title || ' ' || body ILIKE ? ", search_term )
    where( ["user_id ILIKE :term OR course_unit_id ILIKE :term OR finished ILIKE :term OR postpone ILIKE :term", { term: search_term }] )
  end

  def self.search_multiple( words )
    query   = []
    terms   = []
    words.split.each do |word|
      search_term   = "%#{word}%"
      terms << search_term
      terms << search_term
      query << "first_name ILIKE ? OR grade ILIKE ? OR school ILIKE ? OR id ILIKE ?"
    end
    where( [query.join( " OR " )] + terms )
  end
end
