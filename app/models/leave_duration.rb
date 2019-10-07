# frozen_string_literal: true

# == Schema Information
#
# Table name: leave_durations
#
#  id           :bigint           not null, primary key
#  end_date     :date             not null
#  lock_version :integer
#  start_date   :date             not null
#  type         :integer          default("normal"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  leave_id     :bigint           not null
#
# Indexes
#
#  index_leave_durations_on_leave_id  (leave_id)
#
# Foreign Keys
#
#  fk_rails_...  (leave_id => leaves.id)
#


class LeaveDuration < ApplicationRecord
    include LeaveType

    # Validations
    validates :start_date, :end_date, date: true
    validates_presence_of :leave
    validates_associated :leave

    # Associations
    belongs_to :leave, inverse_of: :leave_durations
end
