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
    @schedule.possible_start_1 = @scheduling[:possible_start_1]
    @schedule.possible_end_1 = @scheduling[:possible_end_1]
    @schedule.possible_start_2 = @scheduling[:possible_start_2]
    @schedule.possible_end_2 = @scheduling[:possible_end_2]
    @schedule.possible_start_3 = @scheduling[:possible_start_3]
    @schedule.possible_end_3 = @scheduling[:possible_end_3]
    @schedule.activity_id = @scheduling[:activity_id]
    @schedule.instructor_id = @scheduling[:instructor_id]
    @schedule.user_id = @scheduling[:user_id]
    binding.pry
    @schedule.save!

    flash[:notice] = "Your activity will be scheduled soon!"
    redirect_to root_path
  end
end
