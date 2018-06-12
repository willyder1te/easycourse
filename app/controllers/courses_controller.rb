class CoursesController < ApplicationController
  before_action: set_course, only: [:edit, :update, :destroy, :show]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    @course.save
  end

  def edit
  end

  def update
    @course.update(course_params)
  end

  def show
  end

  def index
    @courses = Course.all
  end

  def destroy
    @course.destroy
  end

  private

  def course_params
    params.require(:course).permit(:category, :start_date, :end_date, :description, :photo, :location, :price, :capacity, :prerequisite)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
