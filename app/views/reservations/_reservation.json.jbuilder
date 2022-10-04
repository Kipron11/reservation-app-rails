json.extract! reservation, :id, :user_id, :transport_id, :time, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
