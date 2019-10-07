# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  avatar        :string
#  designation   :string           not null
#  dob           :date             not null
#  email         :string           not null
#  employee_code :string           not null
#  joining_date  :date             not null
#  leaving_date  :date
#  lock_version  :integer
#  mobile        :string           not null
#  name          :string           not null
#  user_group    :integer          default("normal"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  approver_id   :bigint
#
# Indexes
#
#  index_users_on_approver_id  (approver_id)
#
# Foreign Keys
#
#  fk_rails_...  (approver_id => users.id)
#

class User < ApplicationRecord
    enum user_group: [:normal, :admin]

    # Associations
    belongs_to :approver, class_name: "User", optional: true, inverse_of: :requesters
    has_many :requesters, class_name: "User", foreign_key: "approver_id", dependent: :nullify, inverse_of: :approver
    has_many :leaves, inverse_of: :user, dependent: :destroy
    has_many :leave_earnings, inverse_of: :user, dependent: :destroy
    has_many :leave_consumptions, through: :leaves
end
