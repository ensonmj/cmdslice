class SlicePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    return user
  end

  def update?
    return user && record.user_id == user.id
  end
end
