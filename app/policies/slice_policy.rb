class SlicePolicy < ApplicationPolicy
  # inherit user and record from ApplicationPolicy

  def update?
    return user
  end
end
