# frozen_string_literal: true

class AddLeaveToLeaveEarningConsumption < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :leave_earning_consumptions, :leave, null: false, foreign_key: true, index: false
    add_index :leave_earning_consumptions, :leave_id, algorithm: :concurrently
  end
end
