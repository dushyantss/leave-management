# frozen_string_literal: true

json.extract! notification_group, :id, :created_at, :updated_at
json.url notification_group_url(notification_group, format: :json)
