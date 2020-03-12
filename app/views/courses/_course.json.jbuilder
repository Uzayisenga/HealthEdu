json.extract! course, :id, :image, :title, :credit_number, :content, :upload_file, :course_price, :status, :marks, :attemption, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
