# frozen_string_literal: true

# == Schema Information
#
# Table name: leave_earnings
#
#  id                :bigint           not null, primary key
#  expires_on        :date             not null
#  lock_version      :integer
#  reason            :text             not null
#  type              :integer          default(0), not null
#  value_denominator :bigint           not null
#  value_numerator   :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_leave_earnings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#


class LeaveEarning < ApplicationRecord
    # Associations
    belongs_to :user, inverse_of: :leave_earnings
    has_many :leave_consumptions, inverse_of: :leave_earning
    has_many :leaves, through: :leave_consumptions
end
