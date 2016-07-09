class ContactInfoController < ApplicationController

  def index
    @contact_name = "Sharon Welch"
    @contact_email = "sharon.welch@yale.edu"
    @contacts = [{contact_name: @contact_name, contact_email: @contact_email}]
  end

end
