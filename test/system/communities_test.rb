require "application_system_test_case"

class CommunitiesTest < ApplicationSystemTestCase
  setup do
    @community = communities(:one)
  end

  test "visiting the index" do
    visit communities_url
    assert_selector "h1", text: "Communities"
  end

  test "creating a Community" do
    visit communities_url
    click_on "New Community"

    fill_in "About", with: @community.about
    fill_in "Address", with: @community.address
    fill_in "Country", with: @community.country
    fill_in "Email", with: @community.email
    fill_in "Latitude", with: @community.latitude
    fill_in "Longitude", with: @community.longitude
    fill_in "Name", with: @community.name
    fill_in "Number", with: @community.number
    fill_in "Services", with: @community.services
    check "Status" if @community.status
    click_on "Create Community"

    assert_text "Community was successfully created"
    click_on "Back"
  end

  test "updating a Community" do
    visit communities_url
    click_on "Edit", match: :first

    fill_in "About", with: @community.about
    fill_in "Address", with: @community.address
    fill_in "Country", with: @community.country
    fill_in "Email", with: @community.email
    fill_in "Latitude", with: @community.latitude
    fill_in "Longitude", with: @community.longitude
    fill_in "Name", with: @community.name
    fill_in "Number", with: @community.number
    fill_in "Services", with: @community.services
    check "Status" if @community.status
    click_on "Update Community"

    assert_text "Community was successfully updated"
    click_on "Back"
  end

  test "destroying a Community" do
    visit communities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Community was successfully destroyed"
  end
end
