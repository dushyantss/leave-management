# frozen_string_literal: true

module ValidUser
    extend ActiveSupport::Concern

    included do
        validates_presence_of :user
        validates_associated :user
    end

  end
