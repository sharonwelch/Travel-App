class AddColumnsToInstructorApp < ActiveRecord::Migration
  def change
    add_column :instructor_apps, :new_haven, :text
    add_column :instructor_apps, :hobbies, :text
  end
end
