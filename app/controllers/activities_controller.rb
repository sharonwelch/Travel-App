class ActivitiesController < ApplicationController
  def index
  end

  def create
    complete_activity_hash = params['activity']
    @complete_activity = Activity.new
    @complete_activity.title = complete_activity_hash[:title]
    @complete_activity.description = complete_activity_hash[:description]
    @complete_activity.instructor_id = complete_activity_hash[:instructor_id]
    @complete_activity.location = complete_activity_hash['location']
    @complete_activity.photo = complete_activity_hash['photo']
    @complete_activity.duration = complete_activity_hash['duration']
    @complete_activity.save!

    @instructor = Instructor.new
    @instructor.first_name = complete_activity_hash[:first_name]
    @instructor.last_name = complete_activity_hash[:last_name]
    @instructor.email = complete_activity_hash[:email]
    @instructor.phone = complete_activity_hash[:phone]
    @instructor.picture = complete_activity_hash[:picture]
    @instructor.instructor_apps_id = complete_activity_hash[:instructor_apps_id]
    @instructor.story = complete_activity_hash[:story]
    @instructor.save!

    @tag = params['tag']
    @through_at = ThroughAt.new
    @through_at.tag_id = Tag.where(category: @tag).pluck(:id).first
    @through_at.activity_id = @complete_activity.id
    @through_at.save!

    redirect_to instructors_path
    flash[:notice] = "Congrats on having an instructor page!"
  end

  def update
  end

  def destroy
  end

  def new
    @complete_activity = Activity.new
    @instructor = Instructor.new
    @instructor_id = params[:instructor_id]
    @title = InstructorApp.where(id: @instructor_id).pluck(:activity_title).first
    @first_name = InstructorApp.where(id: @instructor_id).pluck(:first_name).first
    @last_name = InstructorApp.where(id: @instructor_id).pluck(:last_name).first
    @email = InstructorApp.where(id: @instructor_id).pluck(:email).first
    @phone = InstructorApp.where(id: @instructor_id).pluck(:phone_number).first
    @instructor_apps_id = InstructorApp.where(id: @instructor_id).pluck(:id).first
  end

  def show
    # id = params[:id]
    # @activity = Activity.find(id)
  end

  def edit
  end
end
