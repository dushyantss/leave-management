# frozen_string_literal: true

# == Schema Information
#
# Table name: adjustments
#
#  id           :bigint           not null, primary key
#  lock_version :integer
#  reason       :text             not null
#  value        :float            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


require "test_helper"

class AdjustmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
