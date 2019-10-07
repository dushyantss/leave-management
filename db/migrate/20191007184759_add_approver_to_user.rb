# frozen_string_literal: true

class AddApproverToUser < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :users, :approver, null: true, foreign_key: {to_table: :users}, index: false
    add_index :users, :approver_id, algorithm: :concurrently
  end
end
