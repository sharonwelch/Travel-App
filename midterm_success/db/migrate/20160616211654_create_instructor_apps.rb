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
      # t.text :new_haven
      # t.text :hobbies

      t.timestamps null: false
    end
  end
end
