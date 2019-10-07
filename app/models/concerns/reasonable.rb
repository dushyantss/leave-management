# frozen_string_literal: true

module ValidUser
    extend ActiveSupport::Concern

    included do
        validates :reason, presence: true
    end

  end
