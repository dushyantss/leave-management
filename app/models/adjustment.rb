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


class Adjustment < ApplicationRecord
    # Associations
    belongs_to :user, inverse_of: :adjustments
end
