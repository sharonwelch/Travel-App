class InstructorAppsController < ApplicationController
  def index
    @instructor_apps = InstructorApp.all
  end

  def create
    instructor_app_hash = params

    @instructor_app = InstructorApp.new
    @instructor_app.first_name = instructor_app_hash['first_name']
    @instructor_app.last_name = instructor_app_hash['last_name']
    @instructor_app.email = instructor_app_hash['email']
    @instructor_app.phone_number = instructor_app_hash['phone_number']
    @instructor_app.instagram_handle = instructor_app_hash['instagram_handle']
    @instructor_app.blog_url = instructor_app_hash['blog_url']
    @instructor_app.facebook_url = instructor_app_hash['facebook_url']
    @instructor_app.new_haven = instructor_app_hash['new_haven']
    @instructor_app.hobbies = instructor_app_hash['hobbies']
    @instructor_app.save!

    @activity = Activity.new
    @activity.title = instructor_app_hash['activity_title']
    @activity.description = instructor_app_hash['activity_description']
    @activity.instructor_app = @instructor_app
    # @activity.save

    if @activity.save
      redirect_to new_user_registration_path
    else
      flash[:notice] = "Some fields are still blank"
      render :action => :new

    end
  end

  def new
    @instructor_app = InstructorApp.new
    @activity = Activity.new
  end

  def edit
    id = params[:id]
    @instructor_app = InstructorApp.find(id)
  end

  def show
    id = params[:id]
    @instructor_app = InstructorApp.find(id)
  end

  def update
    id = params[:id]
    instructor_app_hash = params
    @instructor_app = InstructorApp.find(id)
    @instructor_app.first_name = instructor_app_hash['first_name']
    @instructor_app.last_name = instructor_app_hash['last_name']
    @instructor_app.email = instructor_app_hash['email']
    @instructor_app.phone_number = instructor_app_hash['phone_number']
    @instructor_app.instagram_handle = instructor_app_hash['instagram_handle']
    @instructor_app.blog_url = instructor_app_hash['blog_url']
    @instructor_app.facebook_url = instructor_app_hash['facebook_url']
    @instructor_app.new_haven = instructor_app_hash['new_haven']
    @instructor_app.hobbies = instructor_app_hash['hobbies']

    if @instructor_app.save
      redirect_to new_user_session_path
      # add else statement
    else
      render :action => :new
    end

  end

  def destroy
    id = params[:id]
    InstructorApp.delete(id)
    flash[:notice] = "You've deleted your Application!"
    redirect_to instructor_apps_path
  end

  def activity
    id = params[:id]
    @activity = Activity.find_by instructor_id: id
    @instructor_app = InstructorApp.find(id)
  end
end
