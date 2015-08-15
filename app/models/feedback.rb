class Feedback < ActiveRecord::Base
	validates :content, presence: true

	belongs_to :user_one, class_name: "User"
	belongs_to :user_two, class_name: "User"
	belongs_to :assignment
end
