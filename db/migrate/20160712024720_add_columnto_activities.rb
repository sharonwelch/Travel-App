class AddColumntoActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.string :availability
    end
  end
end
