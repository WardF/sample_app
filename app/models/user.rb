
class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

 
  # Order doesn't matter for the next two lines.
  has_secure_password  
  validates :password, presence: true, length: { minimum: 6 }
  
end
