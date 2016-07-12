class RemoveColumnFromInstructorApps < ActiveRecord::Migration
  def change
    remove_column :instructor_apps, :picture
  end
end
