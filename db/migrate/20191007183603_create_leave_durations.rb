# frozen_string_literal: true

class CreateLeaveDurations < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_durations do |t|
      t.integer :type, null: false, default: 0
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.integer :lock_version
      t.timestamps
    end
  end
end
