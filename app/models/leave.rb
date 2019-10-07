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
#  user_id       :bigint           not null
#
# Indexes
#
#  index_leaves_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Leave < ApplicationRecord
  STATUSES = [:pending, :rescinded, :rejected, :approved, :reversed]
  enum status: STATUSES

  include ValidUser
  include Reasonable

  # Validations
  validates :status, inclusion: {in: STATUSES}
  validate :status_reason, presence: true, if: -> { [:rescinded, :rejected, :reversed].include?(status) }
  validate :status_update_is_valid

  # Associations
  belongs_to :user, inverse_of: :leaves
  has_many :leave_durations, inverse_of: :leave, dependent: :destroy
  has_many :leave_consumptions, inverse_of: :leave, dependent: :destroy

  private

  def status_update_is_valid
    if status != status_was
      bad_transitions = case status_was
      when :pending
        [:rejected, :reversed]
      when :approved
        [:pending, :rescinded, :rejected]
      else
        STATUSES
      end

      errors.add(:status, :invalid_transition) if bad_transitions.include?(status)
    end
  end
end
