# frozen_string_literal: true

# == Schema Information
#
# Table name: leave_earning_consumptions
#
#  id           :bigint           not null, primary key
#  lock_version :integer
#  value        :float            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


class LeaveEarningConsumption < ApplicationRecord
end
