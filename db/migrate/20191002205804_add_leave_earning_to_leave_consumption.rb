# frozen_string_literal: true

class AddLeaveEarningToLeaveConsumption < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :leave_consumptions, :leave_earning, null: false, foreign_key: true, index: false
    add_index :leave_consumptions, :leave_earning_id, algorithm: :concurrently
  end
end
