class Activity < ActiveRecord::Base
  belongs_to :instructor_app, foreign_key: "instructor_id"
end
