class AdminController < ApplicationController
  def index
    @newapps = InstructorApp.where(workflow_state: :new)
  end

  def accepted
    @acceptedapps = InstructorApp.where(workflow_state: :accepted)
    flash[:notice] = "Notice: " + @acceptedapps.first_name.to_s + @acceptedapps.last_name.to_s + "'s application has been accepted."
  end

  def rejected
    flash[:notice] = "Notice: " + @newapps.first_name.to_s + @newapps.last_name.to_s + "'s application has been rejected."
    @rejectedapps = InstructorApp.where(workflow_state: :rejected)
  end
end
