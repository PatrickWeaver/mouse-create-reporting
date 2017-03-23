json.extract! profile, :id, :user_id, :first_name, :last_name, :avatar, :birth_date, :ethnicity_id, :phone, :gender, :bio, :created_at, :updated_at, :created_at, :updated_at
json.url profile_url(profile, format: :json)
