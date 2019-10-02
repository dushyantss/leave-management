# frozen_string_literal: true

class CreateLeaveEarnings < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_earnings do |t|
      t.float :value, null: false
      t.string :note, null: false
      t.date :expires_on, null: false

      t.integer :lock_version
      t.timestamps
    end
  end
end
