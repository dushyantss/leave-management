# frozen_string_literal: true

# == Schema Information
#
# Table name: leaves
#
#  id            :bigint           not null, primary key
#  lock_version  :integer
#  reason        :text             not null
#  status        :integer          default("pending"), not null
#  status_reason :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "test_helper"

class LeaveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
