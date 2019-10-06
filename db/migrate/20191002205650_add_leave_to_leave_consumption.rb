# frozen_string_literal: true

class AddLeaveToLeaveConsumption < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :leave_consumptions, :leave, null: false, foreign_key: true, index: false
    add_index :leave_consumptions, :leave_id, algorithm: :concurrently
  end
end
