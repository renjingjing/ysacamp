class Contact < ActiveRecord::Base
  validates :email, presence: {message: "must be present"},
            format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  def self.search( contact )
    # thing = "%#{item}%"s
    # where(["title ILIKE ? OR body ILIKE ?", thing, thing])

    search_term = "%#{contact}%"
    # where("title || ' ' || body ILIKE ? ", search_term)
    where(["name ILIKE :term OR email ILIKE :term OR message ILIKE :term", {term: search_term}])
  end
end
