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
    if params["location"] != "" &&  params["location"] != nil
      @courses = Course.near(params["location"], 25)
    end

    if params["category"] != "" && params["category"] != nil
      @category = params["category"]
      if @category != "all"
        @courses = @courses.reject { |course| course.category.downcase != @category }
      end
    end

    if params["max-price"] != "" && params["max-price"] != nil
      max_price = params["max-price"].to_f
      @courses = @courses.reject { |course| course.price > max_price }
    end

    if params["start_time"] != "" && params["start_time"] != nil
      start_time = params["start_time"]
      @courses = @courses.reject { |course| course.start_date < start_time }
    end

    if params["end_time"] != "" && params["end_time"] != nil
      end_time = params["end_time"]
      @courses = @courses.reject { |course| course.end_date > end_time }
    end

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
    redirect_to my_courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :category, :start_date, :end_date, :description, :photo, :location, :price, :capacity, :prerequisite)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
