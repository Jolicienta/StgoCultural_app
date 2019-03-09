json.extract! event, :id, :title, :pic, :flyer, :content, :user_id, :datetime, :latitude, :longitude, :created_at, :updated_at
json.url event_url(event, format: :json)
