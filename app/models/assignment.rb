class Assignment < ActiveRecord::Base
	has_many   :questions
	has_many   :student_assignments
	has_many   :students, through: :student_assignments
	belongs_to :classroom
end
