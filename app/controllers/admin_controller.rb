class AdminController < ApplicationController
  def reviewapps
    @newapps = InstructorApp.where(workflow_state: :new)
  end

  def reviewindividualapp
    @id = InstructorApp.where(workflow_state: :new).pluck(:id).uniq
    if @id.length == 0
      redirect_to noapps_path
    else
      @app = InstructorApp.where(id: @id).first

      @app.workflow_state = "being_reviewed"
      @app.save!
    end
  end

  def submit
    @app = InstructorApp.where(id: @id).first
  end

  def accept
    @id = InstructorApp.where(workflow_state: :being_reviewed).pluck(:id).uniq
    if @id.length == 0
      redirect_to noapps_path
    else
      @app = InstructorApp.where(id: @id).first
      @app.workflow_state = "accepted"
      @app.save!

      redirect_to root_path
    end
  #   @acceptedapps = InstructorApp.where(workflow_state: :accepted)
  #   # flash[:notice] = "Notice: " + @acceptedapps.first_name.to_s + @acceptedapps.last_name.to_s + "'s application has been accepted."
  end

  def reject
    @id = InstructorApp.where(workflow_state: :being_reviewed).pluck(:id).uniq
    if @id.length == 0
      redirect_to noapps_path
    else
      @app = InstructorApp.where(id: @id).first

      @app.workflow_state = "rejected"
      @app.save!

      redirect_to root_path
    end
    # # flash[:notice] = "Notice: " + @newapps.first_name.to_s + @newapps.last_name.to_s + "'s application has been rejected."
    # @rejectedapps = InstructorApp.where(workflow_state: :rejected)
  end

  def noapps
  end

end
