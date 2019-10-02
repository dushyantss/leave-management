# frozen_string_literal: true

class AddLeaveToLeaveDuration < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :leave_durations, :leave, null: false, foreign_key: true, index: false
    add_index :leave_durations, :leave_id, algorithm: :concurrently
  end
end
