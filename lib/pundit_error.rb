module Pundit
  class NotConfirmedError < StandardError
    attr_reader :user

    def initialize(user)
      @user = user
    end
  end
end
