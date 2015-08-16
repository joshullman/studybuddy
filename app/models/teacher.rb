class Teacher < ActiveRecord::Base
	validates :name, :email, :password, presence: true
	validates :email, uniqueness: true

	has_many :classrooms

  has_secure_password
end
