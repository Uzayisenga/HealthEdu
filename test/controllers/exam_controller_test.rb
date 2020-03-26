require 'test_helper'

class ExamControllerTest < ActionDispatch::IntegrationTest
  test "should get assesment" do
    get exam_assesment_url
    assert_response :success
  end

end
