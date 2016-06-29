class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :instructor_id
      t.string :other_social_media
      t.text :love_about_hometown
      t.text :who_are
      t.text :unique_thing
      t.text :activity_desc
      t.string :activity_title
      t.string :why_share
      t.string :photos
      t.string :workflow_state

      t.timestamps null: false
    end
  end
end
