class ApplicationsController < ApplicationController
  def index
    @apps = Applications.all
  end

  def create
    app_hash = params

    @app = Application.new
    @app.first_name = app_hash['first_name']
    @app.last_name = app_hash['last_name']
    @app.email = app_hash['email']
    @app.phone_number = app_hash['phone_number']
    @app.instagram_handle = app_hash['instagram_handle']
    @app.blog_url = app_hash['blog_url']
    @app.facebook_url = app_hash['facebook_url']
    @app.other_social_media = app_hash['other_social_media']
    @app.love_about_hometown = app_hash['love_about_hometown']
    @app.who_are = app_hash['who_are']
    @app.unique_thing = app_hash['unique_thing']
    @app.activity_desc = app_hash['activity_desc']
    @app.activity_title = app_hash['activity_title']
    @app.why_share = app_hash['why_share']
    @app.photos = app_hash['photos']

    @app.save!

    @activity = Activity.new
    @activity.title = app_hash['activity_title']
    @activity.description = app_hash['activity_description']
    @activity.app = @app
    # @activity.save

    if @activity.save
      redirect_to new_user_registration_path
    else
      flash[:notice] = "Some fields are still blank"
      render :action => :new

    end
  end

  def new
    @app = Application.new
    @activity = Activity.new
  end

  def edit
    id = params[:id]
    @app = Application.find(id)
  end

  def show
    id = params[:id]
    @app = Application.find(id)
  end

  def update
    id = params[:id]
    app_hash = params
    @app = Application.find(id)
    @app.first_name = app_hash['first_name']
    @app.last_name = app_hash['last_name']
    @app.email = app_hash['email']
    @app.phone_number = app_hash['phone_number']
    @app.instagram_handle = app_hash['instagram_handle']
    @app.blog_url = app_hash['blog_url']
    @app.facebook_url = app_hash['facebook_url']
    @app.other_social_media = app_hash['other_social_media']
    @app.love_about_hometown = app_hash['love_about_hometown']
    @app.who_are = app_hash['who_are']
    @app.unique_thing = app_hash['unique_thing']
    @app.activity_desc = app_hash['activity_desc']
    @app.activity_title = app_hash['activity_title']
    @app.why_share = app_hash['why_share']
    @app.photos = app_hash['photos']

    if @app.save
      redirect_to new_user_session_path
      # add else statement
    else
      render :action => :new
    end

  end

  def destroy
    id = params[:id]
    Application.delete(id)
    flash[:notice] = "You've deleted your Application!"
    redirect_to applications_path
  end

  def activity
    id = params[:id]
    @activity = Activity.find_by instructor_id: id
    @app = Application.find(id)
  end
end