class Student < ActiveRecord::Base
	has_many :classroom_students
	has_many :classrooms, through: :classroom_students
	has_many :student_assignments
	has_many :assignments, through: :student_assignments

  has_secure_password
end
