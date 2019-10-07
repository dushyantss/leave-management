# frozen_string_literal: true

class CreateLeaveConsumptions < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_consumptions do |t|
      t.integer :value_numerator, null: false
      t.integer :value_denominator, null: false

      t.integer :lock_version
      t.timestamps
    end
  end
end
