class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    #raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    raise Pundit::NotConfirmedError.new(user) unless ConfirmService.confirmed?(user)
    true
  end

  def new?
    create?
  end

  def update?
    raise Pundit::NotConfirmedError.new(user) unless ConfirmService.confirmed?(user)
    true
  end

  def edit?
    update?
  end

  def destroy?
    raise Pundit::NotConfirmedError.new(user) unless ConfirmService.confirmed?(user)
    true
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

