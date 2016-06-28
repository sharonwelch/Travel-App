class ActivitiesController < ApplicationController
  def index
  end

  def create
  end

  def update
  end

  def destroy
  end

  def new
  end

  def show
    id = params[:id]
    @activity = Activity.find(id)
  end

  def edit
  end
end
