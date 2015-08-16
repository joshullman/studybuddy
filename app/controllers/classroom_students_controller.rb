class ClassroomStudentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    # find current classroom
    # add students into current classroom
    @classroom_student = ClassroomStudent.create(classroom_student_params)
  end

  private
    def classroom_student_params
      params.require(:classroom_student).permit(:classroom_id, :student_id)
    end
end
