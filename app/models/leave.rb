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
    enum status: [:pending, :rescinded, :rejected, :approved, :reversed]

    # Associations
    belongs_to :user, inverse_of: :leaves
    has_many :leave_durations, dependent: :destroy
    has_many :leave_earning_consumptions, dependent: :destroy
end
