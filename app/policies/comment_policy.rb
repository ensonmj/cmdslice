class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user
  end

  def destroy?
    user && user.id == record.user_id
  end
end
