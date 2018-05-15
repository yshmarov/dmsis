json.extract! comment, :id, :body, :idea_id, :user_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
