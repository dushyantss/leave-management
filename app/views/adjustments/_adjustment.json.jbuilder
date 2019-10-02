# frozen_string_literal: true

json.extract! adjustment, :id, :reason, :value, :created_at, :updated_at
json.url adjustment_url(adjustment, format: :json)
