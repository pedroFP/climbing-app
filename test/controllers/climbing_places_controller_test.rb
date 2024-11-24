require "test_helper"

class ClimbingPlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @climbing_place = climbing_places(:one)
  end

  test "should get index" do
    get climbing_places_url
    assert_response :success
  end

  test "should get new" do
    get new_climbing_place_url
    assert_response :success
  end

  test "should create climbing_place" do
    assert_difference("ClimbingPlace.count") do
      post climbing_places_url, params: { climbing_place: { address: @climbing_place.address, latitude: @climbing_place.latitude, longitude: @climbing_place.longitude, name: @climbing_place.name } }
    end

    assert_redirected_to climbing_place_url(ClimbingPlace.last)
  end

  test "should show climbing_place" do
    get climbing_place_url(@climbing_place)
    assert_response :success
  end

  test "should get edit" do
    get edit_climbing_place_url(@climbing_place)
    assert_response :success
  end

  test "should update climbing_place" do
    patch climbing_place_url(@climbing_place), params: { climbing_place: { address: @climbing_place.address, latitude: @climbing_place.latitude, longitude: @climbing_place.longitude, name: @climbing_place.name } }
    assert_redirected_to climbing_place_url(@climbing_place)
  end

  test "should destroy climbing_place" do
    assert_difference("ClimbingPlace.count", -1) do
      delete climbing_place_url(@climbing_place)
    end

    assert_redirected_to climbing_places_url
  end
end
