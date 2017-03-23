json.extract! user, :id, :token, :name, :username, :email, :password, :credly, :last_login, :remember_token, :tos, :created_at, :updated_at, :verified_at, :verified_by, :default_group, :created_at, :updated_at
json.url user_url(user, format: :json)
