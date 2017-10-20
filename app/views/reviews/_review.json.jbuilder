json.extract! review, :id, :restaurant_id, :user_id, :numerical_review, :content, :created_at, :updated_at
json.url review_url(review, format: :json)
