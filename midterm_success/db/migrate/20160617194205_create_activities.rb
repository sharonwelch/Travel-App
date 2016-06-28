class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
