# app/controllers/api/enrollments_controller.rb
class Api::EnrollmentsController < ApplicationController
  # GET /api/enrollments OR /api/courses/:course_id/enrollments
  def index
    if params[:course_id]
      course = Course.find(params[:course_id])
      render json: course.enrollments
    else
      render json: Enrollment.all
    end
  end

  # GET /api/enrollments/:id
  def show
    enrollment = Enrollment.find(params[:id])
    render json: enrollment
  end

  # POST /api/enrollments OR /api/courses/:course_id/enrollments
  def create
    enrollment = Enrollment.create!(enrollment_params)
    render json: enrollment
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:user_id, :course_id)
  end
end
