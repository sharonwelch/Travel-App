class WelcomeController < ApplicationController
  def index
   @greeting = "WELCOME"
   @mission_statement = "We are a group of spontaneous, intelligent women who want you to
   experience the world."
   @browse_locals = "Browse our locals"
 end


 def instructor_profile

 end

 def stories
 end

 # def user_reviews
 #   @activities_to_review = Activity.not_reviewed
 # end
end
