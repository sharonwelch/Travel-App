class AddAttachmentActivityPhotoToActivities < ActiveRecord::Migration
  def self.up
    change_table :activities do |t|
      t.attachment :activity_photo
    end
  end

  def self.down
    remove_attachment :activities, :activity_photo
  end
end
