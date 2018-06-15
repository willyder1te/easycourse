class PagesController < ApplicationController
  def home
    @courses = Course.where.not(latitude: nil, longitude: nil).sample(3)
  end
end
