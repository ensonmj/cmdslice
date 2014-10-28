class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user && super
  end

  def destroy?
    user && super && user.id == record.user_id
  end
end
