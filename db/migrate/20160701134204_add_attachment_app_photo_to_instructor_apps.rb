class AddAttachmentAppPhotoToInstructorApps < ActiveRecord::Migration
  def self.up
    change_table :instructor_apps do |t|
      t.attachment :app_photo
    end
  end

  def self.down
    remove_attachment :instructor_apps, :app_photo
  end
end
