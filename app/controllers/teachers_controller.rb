class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      session[:user_id] = @teacher.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def find_teachers
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:username, :password)
  end

end
