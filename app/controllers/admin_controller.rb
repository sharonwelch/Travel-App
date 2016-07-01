class AdminController < ApplicationController
  def index
    @newapps = InstructorApp.where(workflow_state: :new)
  end
end
