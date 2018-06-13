class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy, :show]

  def new
    @course = Course.new
    authorize @course
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    authorize @course
    @course.save
    redirect_to course_path(@course)
  end

  def edit
    authorize @course
  end

  def update
    authorize @course
    @course.update(course_params)
    redirect_to course_path(@course)
  end

  def show
    authorize @course
  end

  def index
    @courses = policy_scope(Course)
  end

  def destroy
    authorize @course
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
