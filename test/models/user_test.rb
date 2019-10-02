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
#
# Indexes
#
#  index_users_on_designation    (designation)
#  index_users_on_email          (email) UNIQUE
#  index_users_on_employee_code  (employee_code) UNIQUE
#  index_users_on_mobile         (mobile) UNIQUE
#  index_users_on_name           (name)
#  index_users_on_user_group     (user_group)
#


require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
