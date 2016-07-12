class AddColumnstoSchedules < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :activity_id
      t.integer :instructor_id
      t.integer :user_id
    end
  end
end
