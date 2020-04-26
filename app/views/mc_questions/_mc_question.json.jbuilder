json.extract! mc_question, :id, :question, :answer, :distractor_1, :distractor_2, :distractor_3, :quiz_id, :created_at, :updated_at
json.url mc_question_url(mc_question, format: :json)
