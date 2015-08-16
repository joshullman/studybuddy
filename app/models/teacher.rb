class Teacher < ActiveRecord::Base
	validates :name, :email, :password_digest, presence: true
	validates :email, uniqueness: true

	has_many :classrooms
end
