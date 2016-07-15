class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
    if current_user.is_instructor == true
      id = InstructorApp.where(email: current_user.email).pluck(:id)
      if id.empty?
        "/instructor_apps/new"
      else
        "/applicationworkflow/#{id}"
      end
    elsif current_user.is_customer == true
      root_path
    elsif current_user.is_admin == true
      reviewapps_path
    end
  end

  def after_sign_up_path_for(resource)
    if current_user.is_instructor == true
      "/instructor_apps/new"
    elsif current_user.is_customer == true
      root_path
    elsif current_user.is_admin == true
      reviewapps_path
    end
  end

  def check_privileges!
    if current_user.is_admin != true
      redirect_to "/", notice: 'You dont have permission to be here'
    end
  end

end
