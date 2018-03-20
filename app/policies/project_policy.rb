class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def edit?
    return true
  end

  def update?
    edit?
  end

  def delete?
    edit?
  end
end
