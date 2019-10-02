# frozen_string_literal: true

class CreateOptionalHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :optional_holidays do |t|
      t.string :title, null: false
      t.text :description
      t.date :date, null: false

      t.integer :lock_version
      t.timestamps
    end
  end
end
