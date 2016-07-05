class Activity < ActiveRecord::Base
  # scope :reviewed, -> {where (reviewed: true)}
  belongs_to :instructors
  has_many :users, :through => :reviews
  has_many :tags, :through => :through_ats
end
