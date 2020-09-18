require "application_system_test_case"

class CompletesTest < ApplicationSystemTestCase
  setup do
    @complete = completes(:one)
  end

  test "visiting the index" do
    visit completes_url
    assert_selector "h1", text: "Completes"
  end

  test "creating a Complete" do
    visit completes_url
    click_on "New Complete"

    fill_in "Favorite", with: @complete.favorite_id
    fill_in "Status", with: @complete.status
    fill_in "User", with: @complete.user_id
    click_on "Create Complete"

    assert_text "Complete was successfully created"
    click_on "Back"
  end

  test "updating a Complete" do
    visit completes_url
    click_on "Edit", match: :first

    fill_in "Favorite", with: @complete.favorite_id
    fill_in "Status", with: @complete.status
    fill_in "User", with: @complete.user_id
    click_on "Update Complete"

    assert_text "Complete was successfully updated"
    click_on "Back"
  end

  test "destroying a Complete" do
    visit completes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Complete was successfully destroyed"
  end
end
