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
    @markers = []
    @marker = {
        lat: @course.latitude,
        lng: @course.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    @markers << @marker

    # @json = Course.find(params[:id]).location.to_gmaps4rails
    authorize @course
  end

  def index
    @courses = policy_scope(Course)
    @courses = Course.where.not(latitude: nil, longitude: nil)

    @markers = @courses.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
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
