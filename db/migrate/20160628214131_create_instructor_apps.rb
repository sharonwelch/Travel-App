class CreateInstructorApps < ActiveRecord::Migration
  def change
    create_table :instructor_apps do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :instagram_handle
      t.string :blog_url
      t.string :facebook_url
      t.string :other_social_media
      t.string :picture
      t.string :activities
      t.text :love_about_hometown
      t.text :who_are
      t.text :unique_thing
      t.text :activity_desc
      t.string :activity_title
      t.string :why_share
      t.string :workflow_state

      t.timestamps null: false
    end
  end
end
