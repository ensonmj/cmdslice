class SlicePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user && super
  end

  def update?
    user && super && record.user_id == user.id
  end
end
