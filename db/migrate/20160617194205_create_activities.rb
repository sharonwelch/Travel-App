class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.integer :instructor_id
      t.string :location
      t.string :photo
      t.string :price
      t.integer :through_id
      t.string :duration

      t.timestamps null: false
    end
  end
end
