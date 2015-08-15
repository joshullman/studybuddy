class Student < ActiveRecord::Base
	validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

	has_many :classroom_students
	has_many :classrooms, through: :classroom_students
	has_many :student_assignments
	has_many :assignments, through: :student_assignments

	has_many :sent_feedbacks, class_name: "Feedback", source: :user_one, foreign_key: "sender"
  has_many :received_feedbacks, class_name: "Feedback", source: :user_two, foreign_key: "receiver"
end
