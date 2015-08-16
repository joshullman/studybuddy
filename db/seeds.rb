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

15.times do
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

1875.times do
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
375.times do
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



Student.create(
  name: "Tanay Arora",
  email: "tarora@g.clemson.edu",
  password_digest: 'tasty'
  )

Classroom.create( teacher_id: 1, name: "Introduction To Women's Studies", description: "#{Faker::Lorem.paragraph}")
Classroom.create( teacher_id: 1, name: "Computer Science 101", description: "#{Faker::Lorem.paragraph}")
Classroom.create( teacher_id: 1, name: "Advanced DBC", description: "#{Faker::Lorem.paragraph}")


ClassroomStudent.create( student_id: 226, classroom_id: 46 )
ClassroomStudent.create( student_id: 226, classroom_id: 47 )
ClassroomStudent.create( student_id: 226, classroom_id: 48 )

Assignment.create(classroom_id: 46, name: "speak to joan of arc in person", content: "#{Faker::Lorem.sentence}")
Assignment.create(classroom_id: 46, name: "get joan of arc's number", content: "#{Faker::Lorem.sentence}")
Assignment.create(classroom_id: 47, name: "win hackathon", content: "#{Faker::Lorem.sentence}")
Assignment.create(classroom_id: 48, name: "EE with sad pizza", content: "#{Faker::Lorem.sentence}")
Assignment.create(classroom_id: 48, name: "game night dance party", content: "#{Faker::Lorem.sentence}")

PairAssignment.create( assignment_id: 376, student_one_id: 226, student_two_id: 1, completed: false, content: nil )
PairAssignment.create( assignment_id: 377, student_one_id: 226, student_two_id: 2, completed: false, content: nil )
PairAssignment.create( assignment_id: 378, student_one_id: 226, student_two_id: 3, completed: false, content: nil )
PairAssignment.create( assignment_id: 379, student_one_id: 226, student_two_id: 4, completed: false, content: nil )
PairAssignment.create( assignment_id: 380, student_one_id: 226, student_two_id: 1, completed: false, content: nil )


