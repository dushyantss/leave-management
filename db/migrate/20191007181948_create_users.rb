# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :designation, null: false
      t.string :email, null: false
      t.string :mobile, null: false
      t.date :dob, null: false
      t.string :employee_code, null: false
      t.date :joining_date, null: false
      t.date :leaving_date
      t.string :avatar
      t.integer :user_group, null: false, default: 0

      t.integer :lock_version
      t.timestamps
    end
  end
end
