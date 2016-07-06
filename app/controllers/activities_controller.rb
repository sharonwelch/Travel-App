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
    binding.pry
    @tag = params['tag']
    @through_at = ThroughAt.new
    @through_at.tag_id = Tag.where(category: @tag).pluck(:id)
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
    @instructor_id = params[:instructor_id]
    @title = InstructorApp.where(id: @instructor_id).pluck(:activity_title).first
  end

  def show
    # id = params[:id]
    # @activity = Activity.find(id)
  end

  def edit
  end
end
