class PairAssignment < ActiveRecord::Base
	belongs_to :student_one, class_name: "Student"
	belongs_to :student_two, class_name: "Student"
	belongs_to :assignment

	def students
		return [self.student_one, self.student_two]
	end
end
