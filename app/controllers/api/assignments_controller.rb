# app/controllers/api/assignments_controller.rb
class Api::AssignmentsController < ApplicationController
  # GET /api/courses/:course_id/assignments OR /api/assignments
  def index
    if params[:course_id]
      course = Course.find(params[:course_id])
      render json: course.assignments
    else
      render json: Assignment.all
    end
  end

  # GET /api/assignments/:id
  def show
    assignment = Assignment.find(params[:id])
    render json: assignment
  end

  # POST /api/courses/:course_id/assignments
  def create
    assignment = Assignment.create!(assignment_params.merge(course_id: params[:course_id]))
    render json: assignment
  end

  private

  def assignment_params
    params.require(:assignment).permit(:title, :due_date)
  end
end
