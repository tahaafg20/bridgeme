require 'test_helper'

class NgosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ngo = ngos(:one)
  end

  test "should get index" do
    get ngos_url
    assert_response :success
  end

  test "should get new" do
    get new_ngo_url
    assert_response :success
  end

  test "should create ngo" do
    assert_difference('Ngo.count') do
      post ngos_url, params: { ngo: { about: @ngo.about, accepted_documents: @ngo.accepted_documents, address: @ngo.address, email: @ngo.email, latitude: @ngo.latitude, link: @ngo.link, longitude: @ngo.longitude, name: @ngo.name, number: @ngo.number, services: @ngo.services, status: @ngo.status } }
    end

    assert_redirected_to ngo_url(Ngo.last)
  end

  test "should show ngo" do
    get ngo_url(@ngo)
    assert_response :success
  end

  test "should get edit" do
    get edit_ngo_url(@ngo)
    assert_response :success
  end

  test "should update ngo" do
    patch ngo_url(@ngo), params: { ngo: { about: @ngo.about, accepted_documents: @ngo.accepted_documents, address: @ngo.address, email: @ngo.email, latitude: @ngo.latitude, link: @ngo.link, longitude: @ngo.longitude, name: @ngo.name, number: @ngo.number, services: @ngo.services, status: @ngo.status } }
    assert_redirected_to ngo_url(@ngo)
  end

  test "should destroy ngo" do
    assert_difference('Ngo.count', -1) do
      delete ngo_url(@ngo)
    end

    assert_redirected_to ngos_url
  end
end
