class RemoveColumnFromInstructors < ActiveRecord::Migration
  def change
    remove_column :instructors, :picture
  end
end
