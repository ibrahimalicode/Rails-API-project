# app/controllers/api/lessons_controller.rb
class Api::LessonsController < ApplicationController
  # GET /api/courses/:course_id/lessons OR /api/lessons
  def index
    if params[:course_id]
      course = Course.find(params[:course_id])
      render json: course.lessons
    else
      render json: Lesson.all
    end
  end

  # GET /api/lessons/:id
  def show
    lesson = Lesson.find(params[:id])
    render json: lesson
  end

  # POST /api/courses/:course_id/lessons
  def create
    lesson = Lesson.create!(lesson_params.merge(course_id: params[:course_id]))
    render json: lesson
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :content)
  end
end
