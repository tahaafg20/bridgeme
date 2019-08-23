require "application_system_test_case"

class NgosTest < ApplicationSystemTestCase
  setup do
    @ngo = ngos(:one)
  end

  test "visiting the index" do
    visit ngos_url
    assert_selector "h1", text: "Ngos"
  end

  test "creating a Ngo" do
    visit ngos_url
    click_on "New Ngo"

    fill_in "About", with: @ngo.about
    fill_in "Accepted documents", with: @ngo.accepted_documents
    fill_in "Address", with: @ngo.address
    fill_in "Email", with: @ngo.email
    fill_in "Latitude", with: @ngo.latitude
    fill_in "Link", with: @ngo.link
    fill_in "Longitude", with: @ngo.longitude
    fill_in "Name", with: @ngo.name
    fill_in "Number", with: @ngo.number
    fill_in "Services", with: @ngo.services
    check "Status" if @ngo.status
    click_on "Create Ngo"

    assert_text "Ngo was successfully created"
    click_on "Back"
  end

  test "updating a Ngo" do
    visit ngos_url
    click_on "Edit", match: :first

    fill_in "About", with: @ngo.about
    fill_in "Accepted documents", with: @ngo.accepted_documents
    fill_in "Address", with: @ngo.address
    fill_in "Email", with: @ngo.email
    fill_in "Latitude", with: @ngo.latitude
    fill_in "Link", with: @ngo.link
    fill_in "Longitude", with: @ngo.longitude
    fill_in "Name", with: @ngo.name
    fill_in "Number", with: @ngo.number
    fill_in "Services", with: @ngo.services
    check "Status" if @ngo.status
    click_on "Update Ngo"

    assert_text "Ngo was successfully updated"
    click_on "Back"
  end

  test "destroying a Ngo" do
    visit ngos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ngo was successfully destroyed"
  end
end
