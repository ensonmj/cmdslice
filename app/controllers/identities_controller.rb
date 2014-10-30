class IdentitiesController < ApplicationController
  skip_after_action :verify_authorized, only: :new

  def new
    @identity = env['omniauth.identity']
  end
end
