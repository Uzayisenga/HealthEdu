require "application_system_test_case"

class CreditsTest < ApplicationSystemTestCase
  setup do
    @credit = credits(:one)
  end

  test "visiting the index" do
    visit credits_url
    assert_selector "h1", text: "Credits"
  end

  test "creating a Credit" do
    visit credits_url
    click_on "New Credit"

    fill_in "Course", with: @credit.course_id
    fill_in "Name", with: @credit.name
    fill_in "Upload file", with: @credit.upload_file
    click_on "Create Credit"

    assert_text "Credit was successfully created"
    click_on "Back"
  end

  test "updating a Credit" do
    visit credits_url
    click_on "Edit", match: :first

    fill_in "Course", with: @credit.course_id
    fill_in "Name", with: @credit.name
    fill_in "Upload file", with: @credit.upload_file
    click_on "Update Credit"

    assert_text "Credit was successfully updated"
    click_on "Back"
  end

  test "destroying a Credit" do
    visit credits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Credit was successfully destroyed"
  end
end
