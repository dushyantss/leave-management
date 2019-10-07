# frozen_string_literal: true

class CreateLeaves < ActiveRecord::Migration[6.0]
  def change
    create_table :leaves do |t|
      t.text :reason, null: false
      t.text :status_reason
      t.integer :status, null: false, default: 0

      t.integer :lock_version
      t.timestamps
    end
  end
end
