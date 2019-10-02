require "application_system_test_case"

class NotificationGroupsTest < ApplicationSystemTestCase
  setup do
    @notification_group = notification_groups(:one)
  end

  test "visiting the index" do
    visit notification_groups_url
    assert_selector "h1", text: "Notification Groups"
  end

  test "creating a Notification group" do
    visit notification_groups_url
    click_on "New Notification Group"

    click_on "Create Notification group"

    assert_text "Notification group was successfully created"
    click_on "Back"
  end

  test "updating a Notification group" do
    visit notification_groups_url
    click_on "Edit", match: :first

    click_on "Update Notification group"

    assert_text "Notification group was successfully updated"
    click_on "Back"
  end

  test "destroying a Notification group" do
    visit notification_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notification group was successfully destroyed"
  end
end
