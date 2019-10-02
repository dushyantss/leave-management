# frozen_string_literal: true

require "application_system_test_case"

class OptionalHolidaysTest < ApplicationSystemTestCase
  setup do
    @optional_holiday = optional_holidays(:one)
  end

  test "visiting the index" do
    visit optional_holidays_url
    assert_selector "h1", text: "Optional Holidays"
  end

  test "creating a Optional holiday" do
    visit optional_holidays_url
    click_on "New Optional Holiday"

    fill_in "Date", with: @optional_holiday.date
    fill_in "Description", with: @optional_holiday.description
    fill_in "Lock version", with: @optional_holiday.lock_version
    fill_in "Title", with: @optional_holiday.title
    click_on "Create Optional holiday"

    assert_text "Optional holiday was successfully created"
    click_on "Back"
  end

  test "updating a Optional holiday" do
    visit optional_holidays_url
    click_on "Edit", match: :first

    fill_in "Date", with: @optional_holiday.date
    fill_in "Description", with: @optional_holiday.description
    fill_in "Lock version", with: @optional_holiday.lock_version
    fill_in "Title", with: @optional_holiday.title
    click_on "Update Optional holiday"

    assert_text "Optional holiday was successfully updated"
    click_on "Back"
  end

  test "destroying a Optional holiday" do
    visit optional_holidays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Optional holiday was successfully destroyed"
  end
end
