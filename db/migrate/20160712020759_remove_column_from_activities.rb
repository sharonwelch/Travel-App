class RemoveColumnFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :photo
  end
end
