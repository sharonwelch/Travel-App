class InstructorsController < ApplicationController
  def index
    # binding.pry
    @allinstructors = InstructorApp.where(workflow_state: :accepted)
    @ids = InstructorApp.where(workflow_state: :accepted).pluck(:id)
  end

  def create
    @newinstructor = Instructor.new
    @newinstructor_app = InstructorApp.where(first_name: params['instructor']['first_name']).where(last_name: params['instructor']['last_name'])

    @newinstructor.first_name = params['instructor']['first_name']
    @newinstructor.last_name = params['instructor']['last_name']
    @newinstructor.story = params['instructor']['story']
    @newinstructor.instructor_apps_id = @newinstructor_app.pluck(:id).first
    @newinstructor.email = @newinstructor_app.pluck(:email).first
    @newinstructor.phone_number = @newinstructor_app.pluck(:phone_number).first
    @newinstructor.save

    @newactivity = Activity.new

    @newactivity.title = params['instructor']['activity']['title']
    @newactivity.description = params['instructor']['activity']['description']
    @newactivity.instructor_id = @newinstructor.id
    @newactivity.location = params['instructor']['activity']['location']
    @newactivity.photo = params['photo']
    @newactivity.duration = params['instructor']['activity']['duration']
    @newactivity.save

    @key = []
    @array = params['instructor']['through_ats'].keys
    0.upto(@array.length) do |x|
      @newthroughat = ThroughAt.new
      @newthroughat.activity_id = @newactivity.id
      hash = params['instructor']['through_ats']
      var = hash[@array[x]]
      if var == "1"
        @key << @array[x]
      end
      @newthroughat.tag_id = Tag.where(category: key).pluck(:id)
      @newthroughat.save
    end
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
    params.require(:instructor).permit(through_ats: [:cooking, :art, :music, :outdoors, :food])
  end

end
