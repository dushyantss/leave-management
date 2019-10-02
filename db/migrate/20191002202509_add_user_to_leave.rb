# frozen_string_literal: true

class AddUserToLeave < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :leaves, :user, null: false, foreign_key: true, index: false
    add_index :leaves, :user_id, algorithm: :concurrently
  end
end
