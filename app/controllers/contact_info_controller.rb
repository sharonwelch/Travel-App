class ContactInfoController < ApplicationController

  def index
    current_admin = true
    svc = ContactService.new(current_admin)
    @names = svc.contact[0]
    @emails = svc.contact[1]
    @contacts = []
    binding.pry
    0.upto(@names.length - 1) do |x|
      name = @names[x]
      email = @emails[x]
      @contacts << {contact_name: name, contact_email: email}
    end
  end

end
