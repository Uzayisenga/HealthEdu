require 'test_helper'

class CourseControllerTest < ActionDispatch::IntegrationTest
  test "should get assesment" do
    get course_assesment_url
    assert_response :success
  end

end
