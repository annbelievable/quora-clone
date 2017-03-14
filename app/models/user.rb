
class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates_confirmation_of :password
  has_secure_password
  has_many :questions
  has_many :answers
end
