class CreateThroughAts < ActiveRecord::Migration
  def change
    create_table :through_ats do |t|
      t.integer :activity_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
