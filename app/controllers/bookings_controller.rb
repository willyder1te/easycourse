class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :destroy, :confirm_booking]
  before_action :set_course, only: [:create, :new]

  # def index
  #   @bookings = Booking.all
  # end

  def show

  end

  def new
    @booking = Booking.new
    @user = current_user

  end

  def create
    @booking = Booking.new
    @booking.course = @course
    @booking.user = current_user
    @booking.save

    redirect_to my_bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to my_bookings_path
  end

  def confirm_booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:course_id)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

end
