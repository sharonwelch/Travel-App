class InstructorApp < ActiveRecord::Base
  has_attached_file :app_photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :app_photo, content_type: /\Aimage\/.*\Z/

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
