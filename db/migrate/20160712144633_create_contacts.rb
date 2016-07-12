class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :fullname
      t.string :email
      t.boolean :current_admin

      t.timestamps null: false
    end
  end
end
