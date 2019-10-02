require 'test_helper'

class NotificationGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notification_group = notification_groups(:one)
  end

  test "should get index" do
    get notification_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_notification_group_url
    assert_response :success
  end

  test "should create notification_group" do
    assert_difference('NotificationGroup.count') do
      post notification_groups_url, params: { notification_group: {  } }
    end

    assert_redirected_to notification_group_url(NotificationGroup.last)
  end

  test "should show notification_group" do
    get notification_group_url(@notification_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_notification_group_url(@notification_group)
    assert_response :success
  end

  test "should update notification_group" do
    patch notification_group_url(@notification_group), params: { notification_group: {  } }
    assert_redirected_to notification_group_url(@notification_group)
  end

  test "should destroy notification_group" do
    assert_difference('NotificationGroup.count', -1) do
      delete notification_group_url(@notification_group)
    end

    assert_redirected_to notification_groups_url
  end
end
