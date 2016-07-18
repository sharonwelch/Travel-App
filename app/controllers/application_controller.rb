class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # saves the location before loading each page so we can return to the
  # right page. If we're on a devise page, we don't want to store that as the
  # place to return to (for example, we don't want to return to the sign in page
  # after signing in), which is what the :unless prevents
  before_filter :store_current_location, :unless => :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    if current_user.is_instructor == true
      id = InstructorApp.where(email: current_user.email).pluck(:id)
      if id.empty?
        "/instructor_apps/new"
      else
        "/applicationworkflow/#{id}"
      end
    elsif current_user.is_customer == true
      stored_location_for(resource_or_scope) || root_path
    elsif current_user.is_admin == true
      reviewapps_path
    else
      root_path
    end

  end

  # def after_sign_up_path_for(resource)
  #   if current_user.is_instructor == true
  #     "/instructor_apps/new"
  #   elsif current_user.is_customer == true
  #     request.env["HTTP_REFERRER"]
  #   elsif current_user.is_admin == true
  #     reviewapps_path
  #   end
  # end

  def check_privileges!
    if current_user.is_admin != true
      redirect_to "/", notice: 'You dont have permission to be here'
    end
  end


  private
    # override the devise helper to store the current location so we can
    # redirect to it after loggin in or out. This override makes signing in
    # and signing up work automatically.
    def store_current_location
      store_location_for(:user, request.url)
    end

end
