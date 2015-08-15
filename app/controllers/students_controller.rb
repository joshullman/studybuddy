class StudentsController < ApplicationController
  def index

  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      session[:user_id] = @student.id
      # redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def student_params
    params.require(:student).permit(:username, :password)
  end
end
