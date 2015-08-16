class Teacher < ActiveRecord::Base
	has_many :classrooms

  has_secure_password
end
