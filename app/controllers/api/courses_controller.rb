class Api::CoursesController < ApplicationController
  def index
    render json: Course.all
  end

  def show
    render json: Course.find(params[:id])
  end

  def create
    course = Course.create(course_params)
    render json: course
  end

  private
  def course_params
    params.require(:course).permit(:title, :description)
  end
end
