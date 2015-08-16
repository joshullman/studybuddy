class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      session[:user_id] = @student.id
      session[:student] = true
      session[:teacher] = false

      redirect_to students_path
    else
      render 'new'
    end
  end

  def show
    p "*" * 80
    @classes = current_student.classrooms
    p "*" * 80
  end

  def class_assignments
    @student = current_student
    class_assignments = Assignment.where(classroom_id: params[:id])
    @student_class_assignments = []
    class_assignments.each do |assignment|
      @student_class_assignments << PairAssignment.where(student_one_id: current_student.id, assignment_id: assignment.id)
      @student_class_assignments << PairAssignment.where(student_two_id: current_student.id, assignment_id: assignment.id)
    end

    p "*" * 20
    p @student_class_assignments
    p "*" * 20


    respond_to do |format|
      format.html {render partial: 'class_assignments', locals: {student_class_assignments: @student_class_assignments}}
      # format.json {render json: @student_class_assignments}
    end
  end


  private

  def student_params
    params.require(:student).permit(:name, :email, :password_digest)
  end
end
