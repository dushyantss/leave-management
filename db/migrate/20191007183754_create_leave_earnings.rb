# frozen_string_literal: true

class CreateLeaveEarnings < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_earnings do |t|
      t.integer :value_numerator, null: false
      t.integer :value_denominator, null: false
      t.integer :type, null: false, default: 0
      t.text :reason, null: false
      t.date :expires_on, null: false

      t.integer :lock_version
      t.timestamps
    end
  end
end
