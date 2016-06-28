class InstructorApp < ActiveRecord::Base
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :phone_number, :presence => true
  validates :instagram_handle, :presence => false
  validates :blog_url, :presence => false
  validates :facebook_url, :presence => false
  validates :new_haven, :presence => true
  validates :hobbies, :presence => true
end
