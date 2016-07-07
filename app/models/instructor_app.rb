class InstructorApp < ActiveRecord::Base
  has_attached_file :app_photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :app_photo, content_type: /\Aimage\/.*\Z/

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :phone_number, :presence => true
  validates :first_name, :presence => true
  validates :love_about_hometown, :presence => true
  validates :who_are, :presence => true
  validates :unique_thing, :presence => true
  validates :activity_desc, :presence => true
  validates :activity_title, :presence => true
  validates :why_share, :presence => true

  include Workflow
  workflow do
    state :new do
      event :submit, :transitions_to => :being_reviewed
    end
    state :being_reviewed do
      event :accept, :transitions_to => :accepted
      event :reject, :transitions_to => :rejected
    end
    state :accepted
    state :rejected
  end
end
