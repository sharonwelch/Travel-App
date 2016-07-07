class InstructorsController < ApplicationController
  def index
    # binding.pry
    @allinstructors = InstructorApp.where(workflow_state: :accepted)
    @ids = InstructorApp.where(workflow_state: :accepted).pluck(:id)
  end

  def create
    # added this
    binding.pry
    @newinstructor = Instructor.new
    @app_id = params[:instructor_apps_id]
    @instructor_app = InstructorApp.where(id: @newinstructor.instructor_apps_id)
    @newinstructor.first_name = @instructorapp.first_name
    @newinstructor.last_name = @instructorapp.last_name
    @newinstructor.email = @instructorapp.email
    @newinstructor.phone_number = @instructorapp.phone_number
  end

  def new
    # added this
    @newinstructor = Instructor.new
  end

  def edit
  end

  def show
    # binding.pry
  end

  def individualinstructor
    id = params[:id]
    @instructor = Instructor.where(id: id).first
    if Activity.where(instructor_id: id).length == 0
      redirect_to instructors_path
      flash[:notice] = "This instructor currently does not have any activities available."
    else
      @activity_id = Activity.where(instructor_id: id).last.id
      @reviews = Review.where(activity_id: @activity_id)
    end
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
