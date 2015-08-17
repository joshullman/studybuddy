class AssignmentsController < ApplicationController
  before_action :find_assignment_params, only: [:show]

  def index
  end

  def show
    p "*" * 100
    p params
    p "*" * 100
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.create(assignment_params)
    redirect_to @assignment
  end

  private
  def find_assignment_params
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:name, :content, :classroom_id)
  end
end
