require "faker"

Teacher.create(
	name: "Teacher", 
	email: "Teacher@teacher.com", 
	password_digest: 'password'
	)

Student.create(
	name: "Student", 
	email: "Student@student.com", 
	password_digest: 'password'
	)

4.times do
	name = Faker::Name.name
	suffix = Faker::Name.suffix
	Teacher.create(
		name: "#{Faker::Name.prefix} #{name} #{suffix}", 
		email: "#{name}.com", 
		password_digest: 'password'
		)	
end

puts "Teachers: #{Teacher.all.length}"

i = 1
5.times do
	Classroom.create(
		teacher_id: i,
		name: "#{Faker::Company.catch_phrase}"
		)
	i += 1
end

puts "Classrooms: #{Classroom.all.length}"

74.times do
	name = Faker::Name.name
	suffix = Faker::Name.suffix
	Student.create(
		name: "#{Faker::Name.prefix} #{name} #{suffix}", 
		email: "#{name}.com", 
		password_digest: 'password'
		)	
end

puts "Students: #{Student.all.length}"

student = 1
75.times do
	classroom = (1 + rand(5))
	ClassroomStudent.create(
		student_id: student,
		classroom_id: classroom
		)
	student += 1
end

puts "ClassroomStudents: #{ClassroomStudent.all.length}"

l = 1
125.times do
	a = (1 + rand(5))
	Assignment.create(
		classroom_id: a,
		name: "#{Faker::Company.bs}"
		)
end

puts "Assignments: #{Assignment.all.length}"

625.times do
	assignment = (1 + rand(125))
	classroom = Assignment.find(assignment).classroom
	students = classroom.students
	student_one = Student.first
	student_two = Student.first
	until student_one.id != student_two.id
		student_one = students.sample
		student_two = students.sample
	end
	flip = (1 + rand(2))
	if flip == 1
		PairAssignment.create(
			assignment_id: Assignment.find(assignment).id,
			student_one_id: student_one.id,
			student_two_id: student_two.id,
			completed: true,
			content: "#{Faker::Lorem.sentence}"
			)
	else
		PairAssignment.create(
			assignment_id: Assignment.find(assignment).id,
			student_one_id: student_one.id,
			student_two_id: student_two.id,
			completed: false,
			content: nil
			)
	end

	assignment += 1
end

puts "PairAssignments: #{PairAssignment.all.length}"

student_ass = 1
125.times do
	ass = PairAssignment.find(student_ass)
	Feedback.create(
		content: "#{Faker::Lorem.paragraph}",
		sender_id: ass.student_one_id,
		receiver_id: ass.student_two_id,
		assignment_id: ass.id
		)
	Feedback.create(
		content: "#{Faker::Lorem.paragraph}",
		sender_id: ass.student_two_id,
		receiver_id: ass.student_one_id,
		assignment_id: ass.id
		)
	student_ass += 1
end

puts "Feedbacks: #{Feedback.all.length}"