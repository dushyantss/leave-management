# frozen_string_literal: true

class AddUserToLeaveEarning < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :leave_earnings, :user, null: false, foreign_key: true, index: false
    add_index :leave_earnings, :user_id, algorithm: :concurrently
  end
end
