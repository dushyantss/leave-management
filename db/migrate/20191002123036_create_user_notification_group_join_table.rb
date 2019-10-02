# frozen_string_literal: true

class CreateUserNotificationGroupJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :notification_groups
  end
end
