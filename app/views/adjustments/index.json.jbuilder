# frozen_string_literal: true

json.array! @adjustments, partial: "adjustments/adjustment", as: :adjustment
