class ScheduleController < ApplicationController
  before_action :authenticate_user!

  def index
    @activity_id = params[:activity_id]
    @instructor_id = Activity.where(id: @activity_id).pluck(:instructor_id)
    @user_id = current_user.id

    current_user.is_customer = true
    current_user.save!
  end

  def create
    activity_id = params[:activity_id]
    @scheduling = params[activity_id]
    @schedule = Schedule.new
    @schedule.possible_start_1 = @scheduling[:possible_start_1].strftime("%A, %m/%d/%y, %I:%M%p -04:00 EST")
    @schedule.possible_end_1 = @scheduling[:possible_end_1].strftime("%A, %m/%d/%y, %I:%M%p -04:00 EST")
    @schedule.possible_start_2 = @scheduling[:possible_start_2].strftime("%A, %m/%d/%y, %I:%M%p -04:00 EST")
    @schedule.possible_end_2 = @scheduling[:possible_end_2].strftime("%A, %m/%d/%y, %I:%M%p -04:00 EST")
    @schedule.possible_start_3 = @scheduling[:possible_start_3].strftime("%A, %m/%d/%y, %I:%M%p -04:00 EST")
    @schedule.possible_end_3 = @scheduling[:possible_end_3].strftime("%A, %m/%d/%y, %I:%M%p -04:00 EST")
    @schedule.activity_id = @scheduling[:activity_id].strftime("%A, %m/%d/%y, %I:%M%p -04:00 EST")
    @schedule.instructor_id = @scheduling[:instructor_id].strftime("%A, %m/%d/%y, %I:%M%p -04:00 EST")
    @schedule.user_id = @scheduling[:user_id]
    binding.pry
    @schedule.save!

    flash[:notice] = "Your activity will be scheduled soon!"
    redirect_to root_path
  end
end
