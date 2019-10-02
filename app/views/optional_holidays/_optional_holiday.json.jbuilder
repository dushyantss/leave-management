# frozen_string_literal: true

json.extract! optional_holiday, :id, :title, :description, :date, :lock_version, :created_at, :updated_at
json.url optional_holiday_url(optional_holiday, format: :json)
