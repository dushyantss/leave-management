# frozen_string_literal: true

json.array! @notification_groups, partial: "notification_groups/notification_group", as: :notification_group
