class AddReviewedToActivity < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.boolean :reviewed
    end
  end
end
