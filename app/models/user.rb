class User < ApplicationRecord

	before_save { email.downcase! }
	
	validates :username, presence: true, length: { minimum: 3, maximum: 42 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: { maximum: 255 },
      format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false } 

  validates :password, presence: true, length: { minimum: 6, maximum: 255 }


	has_many :events
	has_many :registrations

	has_secure_password

end
