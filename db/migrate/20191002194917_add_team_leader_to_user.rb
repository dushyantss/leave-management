# frozen_string_literal: true

class AddTeamLeaderToUser < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :users, :team_leader, null: true, foreign_key: {to_table: :users}, index: false
    add_index :users, :team_leader_id, algorithm: :concurrently
  end
end
