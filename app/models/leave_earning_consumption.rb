# frozen_string_literal: true

# == Schema Information
#
# Table name: leave_earning_consumptions
#
#  id               :bigint           not null, primary key
#  lock_version     :integer
#  value            :float            not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  leave_earning_id :bigint           not null
#  leave_id         :bigint           not null
#
# Indexes
#
#  index_leave_earning_consumptions_on_leave_earning_id  (leave_earning_id)
#  index_leave_earning_consumptions_on_leave_id          (leave_id)
#
# Foreign Keys
#
#  fk_rails_...  (leave_earning_id => leave_earnings.id)
#  fk_rails_...  (leave_id => leaves.id)
#


class LeaveEarningConsumption < ApplicationRecord
    # Associations
    belongs_to :leave, inverse_of: :leave_earning_consumptions
    belongs_to :leave_earning, inverse_of: :leave_earning_consumptions
end
