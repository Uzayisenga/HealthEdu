require 'test_helper'

class CompletesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @complete = completes(:one)
  end

  test "should get index" do
    get completes_url
    assert_response :success
  end

  test "should get new" do
    get new_complete_url
    assert_response :success
  end

  test "should create complete" do
    assert_difference('Complete.count') do
      post completes_url, params: { complete: { favorite_id: @complete.favorite_id, status: @complete.status, user_id: @complete.user_id } }
    end

    assert_redirected_to complete_url(Complete.last)
  end

  test "should show complete" do
    get complete_url(@complete)
    assert_response :success
  end

  test "should get edit" do
    get edit_complete_url(@complete)
    assert_response :success
  end

  test "should update complete" do
    patch complete_url(@complete), params: { complete: { favorite_id: @complete.favorite_id, status: @complete.status, user_id: @complete.user_id } }
    assert_redirected_to complete_url(@complete)
  end

  test "should destroy complete" do
    assert_difference('Complete.count', -1) do
      delete complete_url(@complete)
    end

    assert_redirected_to completes_url
  end
end
