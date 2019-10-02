# == Schema Information
#
# Table name: notification_groups
#
#  id           :bigint           not null, primary key
#  description  :text
#  image        :string
#  lock_version :integer
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class NotificationGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
