# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id             :bigint           not null, primary key
#  avatar         :string
#  designation    :string           not null
#  dob            :date             not null
#  email          :string           not null
#  employee_code  :string           not null
#  joining_date   :date             not null
#  leaving_date   :date
#  lock_version   :integer
#  mobile         :string           not null
#  name           :string           not null
#  user_group     :integer          default("normal"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  team_leader_id :bigint
#
# Indexes
#
#  index_users_on_designation     (designation)
#  index_users_on_email           (email) UNIQUE
#  index_users_on_employee_code   (employee_code) UNIQUE
#  index_users_on_mobile          (mobile) UNIQUE
#  index_users_on_name            (name)
#  index_users_on_team_leader_id  (team_leader_id)
#  index_users_on_user_group      (user_group)
#
# Foreign Keys
#
#  fk_rails_...  (team_leader_id => users.id)
#


class User < ApplicationRecord
    enum user_group: [:normal, :admin]

    # Associations
    belongs_to :team_leader, class_name: "User", foreign_key: "team_leader_id", optional: true, inverse_of: :team_members
    has_many :team_members, class_name: "User", foreign_key: "team_leader_id", dependent: :nullify, inverse_of: :team_leader
    has_and_belongs_to_many :notification_groups
    has_many :leaves, dependent: destroy, inverse_of: :user
    has_many :adjustments, dependent: destroy, inverse_of: :user
end
