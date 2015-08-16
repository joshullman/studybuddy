require "faker"

Teacher.create(
  name: "Bossman Supertroop",
  email: "teacher@teacher.com",
  password_digest: 'password'
  )

Student.create(
  name: "Hunty (It's definitely his birthday today)",
  email: "student@student.com",
  password_digest: 'password'
  )

14.times do
  name = Faker::Name.name
  suffix = Faker::Name.suffix
  Teacher.create(
    name: "#{Faker::Name.prefix} #{name} #{suffix}",
    email: "#{name}.com",
    password_digest: 'password'
    )
end

puts "Teachers: #{Teacher.all.length}"

45.times do
  i = (1 + rand(15))
  3.times do
    Classroom.create(
      teacher_id: i,
      name: "#{Faker::Company.catch_phrase}",
      description: "#{Faker::Lorem.paragraph}"
      )
  end
  i += 1
end

puts "Classrooms: #{Classroom.all.length}"

224.times do
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
225.times do
  3.times do
    classroom = (1 + rand(45))
    ClassroomStudent.create(
      student_id: student,
      classroom_id: classroom
      )
  end
  student += 1
end

puts "ClassroomStudents: #{ClassroomStudent.all.length}"

l = 1
375.times do
  a = (1 + rand(15))
  Assignment.create(
    classroom_id: a,
    name: "#{Faker::Company.bs}",
    content: "#{Faker::Lorem.sentence}"
    )
end

puts "Assignments: #{Assignment.all.length}"

assignment = 1
375.times do
  classroom = Assignment.find(assignment).classroom
  students = classroom.students
  student_one = Student.first
  student_two = Student.first
  until student_one.id != student_two.id
    student_one = students.sample
    student_two = students.sample
  end
    PairAssignment.create(
      assignment_id: Assignment.find(assignment).id,
      student_one_id: student_one.id,
      student_two_id: student_two.id,
      content: "#{Faker::Hacker.say_something_smart}",
      )
    PairAssignment.create(
      assignment_id: Assignment.find(assignment).id,
      student_one_id: student_two.id,
      student_two_id: student_one.id,
      content: "#{Faker::Hacker.say_something_smart}",
      )
  assignment += 1
end

puts "PairAssignments: #{PairAssignment.all.length}"

1875.times do
  a = (1 + rand(PairAssignment.all.length/2))
  Question.create(
    assignment_id: a,
    content: "#{Faker::Lorem.sentence}?",
    answer: "#{Faker::Hacker.say_something_smart}"
    )
end

puts "Questions: #{Question.all.length}"


student_ass = 1
375.times do
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

puts "Feedbacks: #{Feedback.all.length}"
