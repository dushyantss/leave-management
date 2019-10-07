# frozen_string_literal: true

module LeaveType
    extend ActiveSupport::Concern
    LEAVE_TYPES = [:normal, :optional]

    included do
      self.inheritance_column = nil
      enum type: LEAVE_TYPES

      validates :type, inclusion: { in: LEAVE_TYPES }
    end

  end
