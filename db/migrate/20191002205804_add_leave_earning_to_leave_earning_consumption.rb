# frozen_string_literal: true

class AddLeaveEarningToLeaveEarningConsumption < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :leave_earning_consumptions, :leave_earning, null: false, foreign_key: true, index: false
    add_index :leave_earning_consumptions, :leave_earning_id, algorithm: :concurrently
  end
end
