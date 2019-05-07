require "application_system_test_case"

class SuperadminsTest < ApplicationSystemTestCase
  setup do
    @superadmin = superadmins(:one)
  end

  test "visiting the index" do
    visit superadmins_url
    assert_selector "h1", text: "Superadmins"
  end

  test "creating a Superadmin" do
    visit superadmins_url
    click_on "New Superadmin"

    fill_in "Email", with: @superadmin.email
    fill_in "Geofence", with: @superadmin.geofence
    fill_in "Lastname", with: @superadmin.lastname
    fill_in "Name", with: @superadmin.name
    fill_in "Password", with: @superadmin.password
    click_on "Create Superadmin"

    assert_text "Superadmin was successfully created"
    click_on "Back"
  end

  test "updating a Superadmin" do
    visit superadmins_url
    click_on "Edit", match: :first

    fill_in "Email", with: @superadmin.email
    fill_in "Geofence", with: @superadmin.geofence
    fill_in "Lastname", with: @superadmin.lastname
    fill_in "Name", with: @superadmin.name
    fill_in "Password", with: @superadmin.password
    click_on "Update Superadmin"

    assert_text "Superadmin was successfully updated"
    click_on "Back"
  end

  test "destroying a Superadmin" do
    visit superadmins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Superadmin was successfully destroyed"
  end
end
