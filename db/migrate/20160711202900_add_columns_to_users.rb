class AddColumnsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :is_admin
      t.boolean :is_instructor
      t.boolean :is_customer
    end
  end
end
