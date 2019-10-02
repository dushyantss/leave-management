# frozen_string_literal: true

# == Schema Information
#
# Table name: notification_groups
#
#  id           :bigint           not null, primary key
#  description  :text
#  image        :string
#  lock_version :integer
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_notification_groups_on_title  (title) UNIQUE
#

class NotificationGroup < ApplicationRecord

    # Associations
    has_and_belongs_to_many :users
end
