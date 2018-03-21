class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end

  def create?
    true
  end

  def delete?
    is_user_the_creator?
  end
  def quickshow?
    true
  end
  def like?
    return true
  end

  def dislike?
    return true
  end
end
