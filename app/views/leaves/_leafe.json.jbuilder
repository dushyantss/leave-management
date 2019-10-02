# frozen_string_literal: true

json.extract! leafe, :id, :created_at, :updated_at
json.url leafe_url(leafe, format: :json)
