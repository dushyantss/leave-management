# frozen_string_literal: true

# == Schema Information
#
# Table name: leave_earnings
#
#  id           :bigint           not null, primary key
#  expires_on   :date             not null
#  lock_version :integer
#  value        :float            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


class LeaveEarning < ApplicationRecord
    # Associations
    has_many :leave_earning_consumptions, inverse_of: :leave_earning
    has_many :leaves, through: :leave_earning_consumptions
end
