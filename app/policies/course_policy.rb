class CoursePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def index
  #   return true
  # end


  def create?
    !user.nil?
  end

  def new?
    !user.nil?
  end

  def edit?
    is_owner?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    @record.user == @user
  end

end
