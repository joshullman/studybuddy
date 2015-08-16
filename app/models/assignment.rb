class Assignment < ActiveRecord::Base
	validates :name, presence: true

	has_many   :questions
	has_many   :pair_assignments
	belongs_to :classroom
end
