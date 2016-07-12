class RemoveColumnsfromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :activity_id
    remove_column :users, :instructor_id
    remove_column :users, :user_id
  end
end
