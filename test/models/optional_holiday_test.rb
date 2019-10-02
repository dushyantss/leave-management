# frozen_string_literal: true

# == Schema Information
#
# Table name: optional_holidays
#
#  id           :bigint           not null, primary key
#  date         :date             not null
#  description  :text
#  lock_version :integer
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


require "test_helper"

class OptionalHolidayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
