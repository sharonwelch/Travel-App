class UsersController < ApplicationController
  def index
    redirect_to request.referrer || root_path
  end

  def show
    redirect_to request.referrer || root_path
  end

  def devise_controller?
    true
  end
end
