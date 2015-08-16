class Student < ActiveRecord::Base
	validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

	has_many :classroom_students
	has_many :classrooms, through: :classroom_students
	has_many :student_assignments
	has_many :assignments, through: :student_assignments

<<<<<<< HEAD
  has_secure_password
=======
	has_many :sent_feedbacks, class_name: "Feedback", source: :sender, foreign_key: "sender_id"
  has_many :received_feedbacks, class_name: "Feedback", source: :receiver, foreign_key: "receiver_id"
>>>>>>> 9bbdac202f285263639f8e6ff2f9b64313da3c07
end
