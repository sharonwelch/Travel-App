class WelcomeController < ApplicationController
  def index
    @name = "Quirk"
    @greeting = "Connect.Learn.Create."
    @mission_statement = "Don't just see things, experience them. <br> Learn the local lifestyle from the passions of the people who live there.".html_safe
    @browse_locals = "See the local character. Create your experience."
  #  @apply =
 end


 def instructor_profile

 end

 def stories
 end

 # def user_reviews
 #   @activities_to_review = Activity.not_reviewed
 # end

 def user_profile
 end
end
