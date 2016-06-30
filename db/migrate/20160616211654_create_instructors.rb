class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :picture
      t.integer :instructor_apps_id
      t.text :story

      t.timestamps null: false
    end
  end
end
