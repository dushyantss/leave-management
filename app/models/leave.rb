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

class Leave < ApplicationRecord
    enum status: [:pending, :rescinded, :rejected, :approved, :reversed]
end
