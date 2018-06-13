class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new
    return true
  end

  def create
    return true
  end

  def show
    is_owner?
  end

  def destroy
    is_owner?
  end


  private

  def is_owner?
    @record.user == @user
  end

end
