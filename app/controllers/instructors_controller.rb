class InstructorsController < ApplicationController
  def index
    # binding.pry
    @allinstructors = InstructorApp.where(workflow_state: :accepted)
    @ids = InstructorApp.where(workflow_state: :accepted).pluck(:id)
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    # binding.pry
  end

  def individualinstructor
    id = params[:id]
    @instructor = InstructorApp.where(id: id).first
    @activity_id = Activity.where(instructor_id: id).last.id
    @reviews = Review.where(activity_id: @activity_id)
  end

  def filter
    @category = params[:category]
    @tag_id = Tag.where(category: @category).pluck(:id)
    @act_id = ThroughAt.where(tag_id: @tag_id).pluck(:activity_id)
    @activities = Activity.where(id: @act_id)
  end


  def update
  end

  def destroy
  end
end
