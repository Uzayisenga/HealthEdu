require "application_system_test_case"

class McQuestionsTest < ApplicationSystemTestCase
  setup do
    @mc_question = mc_questions(:one)
  end

  test "visiting the index" do
    visit mc_questions_url
    assert_selector "h1", text: "Mc Questions"
  end

  test "creating a Mc question" do
    visit mc_questions_url
    click_on "New Mc Question"

    fill_in "Answer", with: @mc_question.answer
    fill_in "Distractor 1", with: @mc_question.distractor_1
    fill_in "Distractor 2", with: @mc_question.distractor_2
    fill_in "Distractor 3", with: @mc_question.distractor_3
    fill_in "Question", with: @mc_question.question
    fill_in "Quiz", with: @mc_question.quiz_id
    click_on "Create Mc question"

    assert_text "Mc question was successfully created"
    click_on "Back"
  end

  test "updating a Mc question" do
    visit mc_questions_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @mc_question.answer
    fill_in "Distractor 1", with: @mc_question.distractor_1
    fill_in "Distractor 2", with: @mc_question.distractor_2
    fill_in "Distractor 3", with: @mc_question.distractor_3
    fill_in "Question", with: @mc_question.question
    fill_in "Quiz", with: @mc_question.quiz_id
    click_on "Update Mc question"

    assert_text "Mc question was successfully updated"
    click_on "Back"
  end

  test "destroying a Mc question" do
    visit mc_questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mc question was successfully destroyed"
  end
end
