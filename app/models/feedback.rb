class Feedback < ActiveRecord::Base
	validates :content, presence: true

	belongs_to :sender, class_name: "Student"
	belongs_to :receiver, class_name: "Student"
	belongs_to :assignment
end
