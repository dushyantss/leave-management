# frozen_string_literal: true

# == Schema Information
#
# Table name: leave_consumptions
#
#  id                :bigint           not null, primary key
#  lock_version      :integer
#  value_denominator :integer          not null
#  value_numerator   :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  leave_earning_id  :bigint           not null
#  leave_id          :bigint           not null
#
# Indexes
#
#  index_leave_consumptions_on_leave_earning_id  (leave_earning_id)
#  index_leave_consumptions_on_leave_id          (leave_id)
#
# Foreign Keys
#
#  fk_rails_...  (leave_earning_id => leave_earnings.id)
#  fk_rails_...  (leave_id => leaves.id)
#


require "test_helper"

class LeaveConsumptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
