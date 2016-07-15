class Activity < ActiveRecord::Base
  has_attached_file :activity_photo,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png",
    source_file_options: { all: '-auto-orient' }
  validates_attachment_content_type :activity_photo, content_type: /\Aimage\/.*\Z/
  # scope :reviewed, -> {where (reviewed: true)}
  belongs_to :instructors
  has_many :users, :through => :reviews
  has_many :tags, :through => :through_ats
end
