# frozen_string_literal: true

class CreateNotificationGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_groups do |t|
      t.string :title, null: false, index: {unique: true}
      t.text :description
      t.string :image

      t.integer :lock_version
      t.timestamps
    end
  end
end
