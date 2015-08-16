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
    @student = Student.find(1) #replace 1 with current_student
    @classes = Classes.

  private

  def student_params
    params.require(:student).permit(:name, :email, :password_digest)
  end
end
