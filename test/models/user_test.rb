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

require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
