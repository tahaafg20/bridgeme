require "application_system_test_case"

class HealthsTest < ApplicationSystemTestCase
  setup do
    @health = healths(:one)
  end

  test "visiting the index" do
    visit healths_url
    assert_selector "h1", text: "Healths"
  end

  test "creating a Health" do
    visit healths_url
    click_on "New Health"

    fill_in "About", with: @health.about
    fill_in "Address", with: @health.address
    fill_in "Email", with: @health.email
    fill_in "Latitude", with: @health.latitude
    fill_in "Link", with: @health.link
    fill_in "Longitude", with: @health.longitude
    fill_in "Name", with: @health.name
    fill_in "Number", with: @health.number
    fill_in "Services", with: @health.services
    click_on "Create Health"

    assert_text "Health was successfully created"
    click_on "Back"
  end

  test "updating a Health" do
    visit healths_url
    click_on "Edit", match: :first

    fill_in "About", with: @health.about
    fill_in "Address", with: @health.address
    fill_in "Email", with: @health.email
    fill_in "Latitude", with: @health.latitude
    fill_in "Link", with: @health.link
    fill_in "Longitude", with: @health.longitude
    fill_in "Name", with: @health.name
    fill_in "Number", with: @health.number
    fill_in "Services", with: @health.services
    click_on "Update Health"

    assert_text "Health was successfully updated"
    click_on "Back"
  end

  test "destroying a Health" do
    visit healths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Health was successfully destroyed"
  end
end
