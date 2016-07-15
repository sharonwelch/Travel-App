class UsersController < ApplicationController
  def index
    render json: {result: "OK"}
  end

  def show
    render json: {result: "OK"}
  end
end
