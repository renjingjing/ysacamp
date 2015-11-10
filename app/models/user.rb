class User < ActiveRecord::Base
  # http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
has_secure_password
validates :first_name, presence: true
# has_many :courses, dependent: :nullify
validates :email1, presence: {message: "must be present"},
# uniqueness: true, # there are children belong to one family
          format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
          unless: :from_omniauth?

#if user delete from db then do not need keep this user's record
has_many  :attendances,dependent: :destroy
has_many  :registed_units, through: :attendances,source: :course_unit

validates :password_reset_token, uniqueness: true, allow_blank: true

serialize :twitter_raw_data

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

def self.find_from_omniauth(omniauth_data)
   User.where(provider: omniauth_data["provider"],
              uid:      omniauth_data["uid"]).first
 end

 def self.create_from_omniauth(omniauth_data)
   full_name = omniauth_data["info"]["name"].split
   User.create(uid:                      omniauth_data["uid"],
               provider:                 omniauth_data["provider"],
               first_name:               full_name[0],
               last_name:                full_name[1],
               twitter_consumer_token:   omniauth_data["credentials"]["token"],
               twitter_consumer_secret:  omniauth_data["credentials"]["secret"],
               twitter_raw_data:         omniauth_data,
               password:                 SecureRandom.hex(16)
               )
 end

 def from_omniauth?
     uid.present? && provider.present?
end

def psaaword_reset_expired?
  Time.new > password_reset_expiry_date
end

def password_reset_expired?
    Time.now > password_reset_expiry_date
  end

def reset_token
  self.password_reset_token       = nil
  self.password_reset_expiry_date = nil
  save
end

  def generate_password_reset_token
    begin
      self.password_reset_token = SecureRandom.urlsafe_base64(32)
    end while User.exists?(password_reset_token: self.password_reset_token)
    self.password_reset_expiry_date = Time.now + 1.days
    save
  end
end
