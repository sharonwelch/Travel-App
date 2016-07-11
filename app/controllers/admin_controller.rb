class AdminController < ApplicationController
  def reviewapps
    @newapps = InstructorApp.where(workflow_state: :new)
  end

  def reviewindividualapp
    @id = params[:id]
    # @id = InstructorApp.where(workflow_state: :new).pluck(:id).uniq
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

  def being_reviewed
    @apps_under_review = InstructorApp.where(workflow_state: :being_reviewed)
  end

  def accept
    @id = InstructorApp.where(workflow_state: :being_reviewed).pluck(:id).uniq
    if @id.length == 0
      # redirect_to noapps_path
      redirect_to apps_under_review_path
    else
      @app = InstructorApp.where(id: @id).first
      @app.workflow_state = "accepted"
      @app.save!

      @acceptedapps = InstructorApp.where(workflow_state: :accepted)
      redirect_to acceptedapps_path
      flash[:notice] = @app.first_name + " " + @app.last_name + "'s application was just accepted!"
      #UserNotifier.send_accepted_email.deliver_now
    end
  end

  def reject
    @id = InstructorApp.where(workflow_state: :being_reviewed).pluck(:id).uniq
    if @id.length == 0
      redirect_to noapps_path
    else
      @app = InstructorApp.where(id: @id).first
      @app.workflow_state = "rejected"
      @app.save!

      @rejectedapps = InstructorApp.where(workflow_state: :rejected)
      redirect_to rejectedapps_path
      flash[:notice] = @app.first_name + " " + @app.last_name + "'s application was just rejected :("
    end
  end

  def noapps
  end

  def acceptedapps
    @acceptedapps = InstructorApp.where(workflow_state: :accepted)
  end

  def rejectedapps
    @rejectedapps = InstructorApp.where(workflow_state: :rejected)
  end

end
