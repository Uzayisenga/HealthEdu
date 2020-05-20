require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get quiz" do
    get pages_quiz_url
    assert_response :success
  end

end
