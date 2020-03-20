json.extract! payment, :id, :amount, :user_id, :course_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
