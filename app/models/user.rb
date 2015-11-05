class User < ActiveRecord::Base
  # http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
has_secure_password
# has_many :courses, dependent: :nullify
validates :email1, presence: {message: "must be present"},
# uniqueness: true, # there are children belong to one family
          format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

has_many  :user_course_units, dependent: :destroy
has_many  :registed_units, through: :user_course_units,source: :course_unit

def self.recent
  order(:created_at).reverse_order
end

def self.ten
  limit(10)
end

def self.recent_ten
  recent.ten
end

def self.search(item)
  # thing = "%#{item}%"
  # where(["title ILIKE ? OR body ILIKE ?", thing, thing])

  search_term = "%#{item}%"
  # where("title || ' ' || body ILIKE ? ", search_term)
  where(["first_name ILIKE :term OR grade ILIKE :term OR parent_name ILIKE :term OR email1 ILIKE :term OR school ILIKE :term", {term: search_term}])
end

def self.search_multiple(words)
  query   = []
  terms   = []
  words.split.each do |word|
    search_term   = "%#{word}%"
    terms << search_term
    terms << search_term
    query << "first_name ILIKE ? OR grade ILIKE ? OR school ILIKE ? OR id ILIKE ?"
  end
  where([query.join(" OR ")] + terms)
end

def full_name
  "#{first_name} #{last_name}".strip
end
end
