class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :instagram_handle
      t.string :blog_url
      t.string :facebook_url
      t.string :activities
      t.string :picture

      t.timestamps null: false
    end
  end
end
