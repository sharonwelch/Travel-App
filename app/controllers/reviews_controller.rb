class ReviewsController < ApplicationController
  def index
  end

  def create
    review_hash = params
    @review = Review.new
    @review.first_name = review_hash['first_name']
    @review.last_name = review_hash['last_name']
    @review.rating = review_hash['rating']
    @review.content = review_hash['content']
    @review.activity_id = review_hash['activity_id']
    @instructor_id = review_hash['instructor_id'].to_i
    @review.save!
    flash[:notice] = "Thank you for submitting your review!"
    redirect_to "/individualinstructor/#{@instructor_id}"
  end

  def new
    @review = Review.new
    @activity_id = params[:activity_id]
    @instructor_id = Activity.where(id: @activity_id).pluck(:instructor_id).first

  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
