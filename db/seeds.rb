require "faker"

Teacher.create(
	name: "Teacher", 
	email: "Teacher@teacher.com", 
	password: 'password'
	)

Student.create(
	name: "Student", 
	email: "Student@student.com", 
	password: 'password'
	)

4.times do
	name = Faker::Name.name
	suffix = Faker::Name.suffix
	Teacher.create(
		name: "#{Faker::Name.prefix} #{name} #{suffix}", 
		email: "#{name}.com", 
		password: 'password'
		)	
end

i = 1
5.times do
	Classroom.create(
		teacher_id: i,
		name: "#{Faker::Company.catch_phrase}"
		)
	i += 1
end

74.times do
	name = Faker::Name.name
	suffix = Faker::Name.suffix
	Student.create(
		name: "#{Faker::Name.prefix} #{name} #{suffix}", 
		email: "#{name}.com", 
		password: 'password'
		)	
end

student = 1
75.times do
	classroom = (1 + rand(5))
	ClassroomStudent.create(
		student_id: student,
		classroom_id: classroom
		)
	student += 1
end

l = 1
125.times do
	a = (1 + rand(5))
	Assignment.create(
		classroom_id: a,
		name: "#{Faker::Company.bs}"
		)
end

assignment = 1
125.times do
	classroom = Assignment.find(assignment).classroom
	students = classroom.students
	student_one = students.sample
	student_two = students.sample
	if student_one.id != student_two.id
		StudentAssignment.create(
			assignment_id: Assignment.find(assignment).id,
			student_id: student_one.id
			)
		StudentAssignment.create(
			assignment_id: Assignment.find(assignment).id,
			student_id: student_two.id
			)
	end
	assignment += 1
end

625.times do
	a = (1 + rand(Assignment.all.length))
	Question.create(
		assignment_id: a,
		content: "#{Faker::Lorem.sentence}?",
		answer: "#{Faker::Hacker.say_something_smart}"
		)
end

student_ass = 1
125.times do
	ass = Assignment.find(student_ass)
	Feedback.create(
		content: "#{Faker::Lorem.paragraph}",
		sender_id: ass.students.first.id,
		receiver_id: ass.students.last.id,
		assignment_id: ass.id
		)
	Feedback.create(
		content: "#{Faker::Lorem.paragraph}",
		sender_id: ass.students.last.id,
		receiver_id: ass.students.first.id,
		assignment_id: ass.id
		)
	student_ass += 1
end