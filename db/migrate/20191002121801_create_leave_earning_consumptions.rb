# frozen_string_literal: true

class CreateLeaveEarningConsumptions < ActiveRecord::Migration[6.0]
  def change
    create_table :leave_earning_consumptions do |t|
      t.float :value, null: false

      t.integer :lock_version
      t.timestamps
    end
  end
end
