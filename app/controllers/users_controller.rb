class UsersController < ApplicationController
  before_action :set_user, only: :show

  def show
    @courses = Course.where.not(latitude: nil, longitude: nil).sample(3)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to show_profile_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :location, :photo, :description, :payment_preferences)
  end

end
