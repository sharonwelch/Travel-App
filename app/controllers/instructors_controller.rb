class InstructorsController < ApplicationController
  def index
    # binding.pry
    @allinstructors = InstructorApp.where(workflow_state: :accepted)
    @ids = InstructorApp.where(workflow_state: :accepted).pluck(:id)
  end

  def create
    @newinstructor = Instructor.new(instructor_params)
    # @app_id = params[:instructor_apps_id]
    # @instructor_app = InstructorApp.where(id: @newinstructor.instructor_apps_id)
    @newinstructor.first_name = @instructorapp.first_name
    @newinstructor.last_name = @instructorapp.last_name
    @newinstructor.email = @instructorapp.story
    @newinstructor.phone_number = @instructorapp.phone_number

    @newinstructor.save
    binding.pry

    @newactivity = Activity.new(params[:activity_params])
    @newinstructor.activities << @newactivity
    @newactivity.save

  end


  def new
    # added this
    @newinstructor = Instructor.new
    @newactivity = Activity.new

    # if @newinstructor.save
    #   flash[:notice] = "Your information will be posted to our website shortly"
    # else
    #   # add condition here
    # end
  end

  def edit
  end

  def show
    # binding.pry
  end

  def individualinstructor
    id = params[:id]
    @instructor = InstructorApp.where(id: id).first
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

  private
  def instructor_params
    params.require(:instructor).permit(activity_attributes: [:title, :description, :location, :duration, :photo])
    params.require(:instructor).permit(through_ats_attributes: [:tag_id])
  end

end
