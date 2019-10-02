# frozen_string_literal: true

# == Schema Information
#
# Table name: leave_durations
#
#  id           :bigint           not null, primary key
#  end          :date             not null
#  lock_version :integer
#  start        :date             not null
#  type         :integer          default("normal"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require "test_helper"

class LeaveDurationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
