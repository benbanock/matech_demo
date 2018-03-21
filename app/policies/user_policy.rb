class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def index?
    is_user_the_creator?
  end

  def edit?
    is_user_the_creator?
  end

  def update?
    is_user_the_creator?
  end

    private

  def is_user_the_creator?
    record == user
  end
end
