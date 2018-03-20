class UserProjectPolicy < ApplicationPolicy

  def create?
    return true
  end

  def destroy?
    return true
  end

  def edit?
    return true
  end
end
