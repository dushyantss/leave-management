# frozen_string_literal: true

class AddUserToAdjustment < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :adjustments, :user, null: false, foreign_key: true, index: false
    add_index :adjustments, :user_id, algorithm: :concurrently
  end
end
