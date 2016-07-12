class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :possible_start_1
      t.datetime :possible_end_1
      t.datetime :possible_start_2
      t.datetime :possible_end_2
      t.datetime :possible_start_3
      t.datetime :possible_end_3

      t.timestamps null: false
    end
  end
end
