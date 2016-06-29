class ThroughAt < ActiveRecord::Base
  belongs_to :activity
  belongs_to :tag
end
