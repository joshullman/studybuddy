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
      redirect_to student_index_path
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(1) #replace 1 with current_student
    @classes = Classes.

  private

  def student_params
    params.require(:student).permit(:username, :password)
  end
end
