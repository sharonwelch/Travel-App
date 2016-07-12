class AddAttachmentInstructorPhotoToInstructors < ActiveRecord::Migration
  def self.up
    change_table :instructors do |t|
      t.attachment :instructor_photo
    end
  end

  def self.down
    remove_attachment :instructors, :instructor_photo
  end
end
