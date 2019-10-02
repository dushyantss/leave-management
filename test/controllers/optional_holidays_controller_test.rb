# frozen_string_literal: true

require "test_helper"

class OptionalHolidaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @optional_holiday = optional_holidays(:one)
  end

  test "should get index" do
    get optional_holidays_url
    assert_response :success
  end

  test "should get new" do
    get new_optional_holiday_url
    assert_response :success
  end

  test "should create optional_holiday" do
    assert_difference("OptionalHoliday.count") do
      post optional_holidays_url, params: { optional_holiday: { date: @optional_holiday.date, description: @optional_holiday.description, lock_version: @optional_holiday.lock_version, title: @optional_holiday.title } }
    end

    assert_redirected_to optional_holiday_url(OptionalHoliday.last)
  end

  test "should show optional_holiday" do
    get optional_holiday_url(@optional_holiday)
    assert_response :success
  end

  test "should get edit" do
    get edit_optional_holiday_url(@optional_holiday)
    assert_response :success
  end

  test "should update optional_holiday" do
    patch optional_holiday_url(@optional_holiday), params: { optional_holiday: { date: @optional_holiday.date, description: @optional_holiday.description, lock_version: @optional_holiday.lock_version, title: @optional_holiday.title } }
    assert_redirected_to optional_holiday_url(@optional_holiday)
  end

  test "should destroy optional_holiday" do
    assert_difference("OptionalHoliday.count", -1) do
      delete optional_holiday_url(@optional_holiday)
    end

    assert_redirected_to optional_holidays_url
  end
end
