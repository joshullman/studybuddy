class Teacher < ActiveRecord::Base
	validates :name, :email, :password_digest, presence: true
	validates :email, uniqueness: true

	has_many :classrooms

  has_secure_password #not encrypting password
end
