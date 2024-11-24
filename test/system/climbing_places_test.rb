require "application_system_test_case"

class ClimbingPlacesTest < ApplicationSystemTestCase
  setup do
    @climbing_place = climbing_places(:one)
  end

  test "visiting the index" do
    visit climbing_places_url
    assert_selector "h1", text: "Climbing places"
  end

  test "should create climbing place" do
    visit climbing_places_url
    click_on "New climbing place"

    fill_in "Address", with: @climbing_place.address
    fill_in "Latitude", with: @climbing_place.latitude
    fill_in "Longitude", with: @climbing_place.longitude
    fill_in "Name", with: @climbing_place.name
    click_on "Create Climbing place"

    assert_text "Climbing place was successfully created"
    click_on "Back"
  end

  test "should update Climbing place" do
    visit climbing_place_url(@climbing_place)
    click_on "Edit this climbing place", match: :first

    fill_in "Address", with: @climbing_place.address
    fill_in "Latitude", with: @climbing_place.latitude
    fill_in "Longitude", with: @climbing_place.longitude
    fill_in "Name", with: @climbing_place.name
    click_on "Update Climbing place"

    assert_text "Climbing place was successfully updated"
    click_on "Back"
  end

  test "should destroy Climbing place" do
    visit climbing_place_url(@climbing_place)
    click_on "Destroy this climbing place", match: :first

    assert_text "Climbing place was successfully destroyed"
  end
end
