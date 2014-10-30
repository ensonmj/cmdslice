class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    false if user.nil?
    raise Pundit::NotConfirmedError, user unless ConfirmService.confirmed?(user)
    true
  end

  def destroy?
    user && user.id == record.user_id
  end
end
