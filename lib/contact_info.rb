require 'rspec'
#
# def initialize(current_admin)
#   @is_current_admin = current_admin
# end

def contact
  fullnames = Contact.where(current_admin: true).pluck(:fullname).uniq
  emails = Contact.where(current_admin: true).pluck(:email).uniq
  return info = [fullnames, emails]
end
