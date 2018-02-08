class User < ApplicationRecord

	has_many :events
	has_many :registrations

	has_secure_password

	before_save { email.downcase! }
	before_save { username.downcase! }

	validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 42 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
      format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false } 

  validates :password, presence: true, confirmation: { case_sensitive: true }, length: { minimum: 6, maximum: 255 }

end
