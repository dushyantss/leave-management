# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, index: true
      t.string :designation, null: false, index: true
      t.string :email, null: false, index: {unique: true}
      t.string :mobile, null: false, index: {unique: true}
      t.date :dob, null: false
      t.string :employee_code, null: false, index: {unique: true}
      t.date :joining_date, null: false
      t.date :leaving_date
      t.string :avatar
      t.integer :user_group, null: false, default: 0, index: true

      t.integer :lock_version
      t.timestamps
    end
  end
end
