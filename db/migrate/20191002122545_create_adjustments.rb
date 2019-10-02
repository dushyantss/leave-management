# frozen_string_literal: true

class CreateAdjustments < ActiveRecord::Migration[6.0]
  def change
    create_table :adjustments do |t|
      t.text :reason, null: false
      t.float :value, null: false

      t.integer :lock_version
      t.timestamps
    end
  end
end
