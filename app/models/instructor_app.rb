class InstructorApp < ActiveRecord::Base

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
