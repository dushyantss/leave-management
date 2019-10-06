# frozen_string_literal: true

# == Schema Information
#
# Table name: leave_earnings
#
#  id                :bigint           not null, primary key
#  expires_on        :date             not null
#  lock_version      :integer
#  value_denominator :bigint           not null
#  value_numerator   :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#


require "test_helper"

class LeaveEarningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
