class SlicePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.includes(:user).order("updated_at desc")
    end
  end

  def create?
    return false if user.nil?
    raise Pundit::NotConfirmedError, user unless ConfirmService.confirmed?(user)
    true
  end

  def update?
    user && record.user_id == user.id
  end
end
