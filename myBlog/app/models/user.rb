class User < ApplicationRecord

  has_secure_password
  
  EMAIL_REGEX = /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/i
  
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :posts
  has_many :comments

  before_save :email_lowercase

  def email_lowercase
  	email.downcase!
  end

end
