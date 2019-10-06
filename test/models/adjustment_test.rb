# frozen_string_literal: true

# == Schema Information
#
# Table name: adjustments
#
#  id           :bigint           not null, primary key
#  lock_version :integer
#  reason       :text             not null
#  value        :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_adjustments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#


require "test_helper"

class AdjustmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
