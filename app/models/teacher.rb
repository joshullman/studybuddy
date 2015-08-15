class Teacher < ActiveRecord::Base
	validates :name, :email, :password, presence: true
	validates :email, uniqueness: true

	has_many :classrooms
end
