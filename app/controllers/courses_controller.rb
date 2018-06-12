class CoursesController < ApplicationController
  before_action: set_course, only: [:edit, :update, :destroy, :show]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    @course.save
    redirect_to course_path(@course)
  end

  def edit
  end

  def update
    @course.update(course_params)
    redirect_to course_path(@course)
  end

  def show
  end

  def index
    @courses = Course.all
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :category, :start_date, :end_date, :description, :photo, :location, :price, :capacity, :prerequisite)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
