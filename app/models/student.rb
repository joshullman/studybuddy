class Student < ActiveRecord::Base
	validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true

	has_many :classroom_students
	has_many :classrooms, through: :classroom_students

	has_many :student_ones, class_name: "PairAssignment", source: :student_one, foreign_key: "student_one_id"
	has_many :student_twos, class_name: "PairAssignment", source: :student_two, foreign_key: "student_two_id"

	has_many :sent_feedbacks, class_name: "Feedback", source: :sender, foreign_key: "sender_id"
  has_many :received_feedbacks, class_name: "Feedback", source: :receiver, foreign_key: "receiver_id"

  has_secure_password #not encrypting password
end
