# frozen_string_literal: true

module LeaveType
    extend ActiveSupport::Concern

    included do
      self.inheritance_column = nil
      enum type: [:normal, :optional]
    end

  end
