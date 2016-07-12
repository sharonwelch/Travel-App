class ContactService
  attr_accessor :current_admin

  def initialize(current_admin)
    @is_current_admin = current_admin
  end

  def contact
    fullnames = Contact.where(current_admin: @is_current_admin).pluck(:fullname).uniq
    emails = Contact.where(current_admin: @is_current_admin).pluck(:email).uniq
    info = [fullnames, emails]
  end
end
