class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    false
  end

  def show?
    #scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    # may update profile or identity password
    user && user == record
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
