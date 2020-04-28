require 'test_helper'

class McQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mc_question = mc_questions(:one)
  end

  test "should get index" do
    get mc_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_mc_question_url
    assert_response :success
  end

  test "should create mc_question" do
    assert_difference('McQuestion.count') do
      post mc_questions_url, params: { mc_question: { answer: @mc_question.answer, distractor_1: @mc_question.distractor_1, distractor_2: @mc_question.distractor_2, distractor_3: @mc_question.distractor_3, question: @mc_question.question, quiz_id: @mc_question.quiz_id } }
    end

    assert_redirected_to mc_question_url(McQuestion.last)
  end

  test "should show mc_question" do
    get mc_question_url(@mc_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_mc_question_url(@mc_question)
    assert_response :success
  end

  test "should update mc_question" do
    patch mc_question_url(@mc_question), params: { mc_question: { answer: @mc_question.answer, distractor_1: @mc_question.distractor_1, distractor_2: @mc_question.distractor_2, distractor_3: @mc_question.distractor_3, question: @mc_question.question, quiz_id: @mc_question.quiz_id } }
    assert_redirected_to mc_question_url(@mc_question)
  end

  test "should destroy mc_question" do
    assert_difference('McQuestion.count', -1) do
      delete mc_question_url(@mc_question)
    end

    assert_redirected_to mc_questions_url
  end
end
