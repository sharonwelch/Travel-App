class Instructor < ActiveRecord::Base
  has_attached_file :instructor_photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :instructor_photo, content_type: /\Aimage\/.*\Z/

  has_many :activities

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :activities
  has_one :instructor_app

  # validates :first_name, :presence => true
  # validates :last_name, :presence => true
  # validates :email, :presence => true
  # validates :phone_number, :presence => true
  # validates :story, :presence => true
  # validates :picture, :presence => true
end
