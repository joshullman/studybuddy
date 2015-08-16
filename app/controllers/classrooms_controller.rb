class ClassroomsController < ApplicationController
  before_action :find_classroom_params, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show
    @teacher = current_teacher
    @classroom_student = ClassroomStudent.new
    @students = Student.all
  end

  def new
    @classroom = Classroom.new
    @teacher = current_teacher
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @classroom = @teacher.classrooms.new(classroom_params)

    if @classroom.save
      redirect_to teacher_classroom_path(@teacher, @classroom)
    else
      @error = @classroom.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_classroom_params
    @classroom = Classroom.find(params[:id])
  end

  def classroom_params
    params.require(:classroom).permit(:name, :teacher_id)
  end

end
