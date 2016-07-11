class ScheduleController < ApplicationController
  before_action :authenticate_user!

  def index
    @activity_id = params[:activity_id]
    @instructor_id = Activity.where(id: @activity_id).pluck(:instructor_id)
    @user_id = current_user.id

    current_user.is_customer = true
    current_user.save!
  end
end
