class WelcomeController < ApplicationController
  def index
    @name = "Wanderlocal"
    @greeting = "Connect. Learn. Create."
    @mission_statement = "Don't just see things, experience them. <br> Learn the local lifestyle from the passions of the people who live there.".html_safe
    @browse_locals = "See the local character. <br> Create your own experience.".html_safe
 end

end
