# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  designation :string
#  email       :string
#  mobile      :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
