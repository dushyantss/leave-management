# frozen_string_literal: true

class CreateLeaveEarnings < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_earnings do |t|
      t.bigint :value_numerator, null: false
      t.bigint :value_denominator, null: false
      t.date :expires_on, null: false

      t.integer :lock_version
      t.timestamps
    end
  end
end
