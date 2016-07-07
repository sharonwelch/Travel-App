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
    @instructor_app.other_social_media = instructor_app_hash['other_social_media']
    @instructor_app.love_about_hometown = instructor_app_hash['love_about_hometown']
    @instructor_app.who_are = instructor_app_hash['who_are']
    @instructor_app.unique_thing = instructor_app_hash['unique_thing']
    @instructor_app.activity_desc = instructor_app_hash['activity_desc']
    @instructor_app.activity_title = instructor_app_hash['activity_title']
    @instructor_app.why_share = instructor_app_hash['why_share']
    @instructor_app.picture = instructor_app_hash['picture']

    binding.pry
    if @instructor_app.save
      flash[:notice] = "Thank you for submitting your application!"
      redirect_to root_path
    else
      flash[:notice] = "Some fields are still blank"
      render :action => :new
    end
  end

  def new
    @instructor_app = InstructorApp.new
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
    @instructor_app.other_social_media = instructor_app_hash['other_social_media']
    @instructor_app.love_about_hometown = instructor_app_hash['love_about_hometown']
    @instructor_app.who_are = instructor_app_hash['who_are']
    @instructor_app.unique_thing = instructor_app_hash['unique_thing']
    @instructor_app.activity_desc = instructor_app_hash['activity_desc']
    @instructor_app.activity_title = instructor_app_hash['activity_title']
    @instructor_app.why_share = instructor_app_hash['why_share']
    @instructor_app.picture = instructor_app_hash['picture']


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

  # this is no longer relevant
  # def activity
  #   id = params[:id]
  #   @activity = Activity.find_by instructor_id: id
  #   @instructor_app = InstructorApp.find(id)
  # end
end
