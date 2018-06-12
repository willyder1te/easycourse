class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :destroy, :confirm_booking]
  before_action :set_course, only: [:create]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.course = @course
    @booking.save
    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  def confirm_booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :user_id, :course_id)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

end
