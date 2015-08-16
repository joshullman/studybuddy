class Question < ActiveRecord::Base
	validates :content, :answer, presence: true

	belongs_to :assignment
end
