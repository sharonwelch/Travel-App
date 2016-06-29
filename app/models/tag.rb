class Tag < ActiveRecord::Base
  has_many :activities, :through => :through_ats
end
