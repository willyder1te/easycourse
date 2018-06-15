class DashboardController < ApplicationController

  def courses_index
  end

  def bookings_index
    @bookings = current_user.bookings
  end
end
