json.extract! booking, :id, :status, :cruise_id, :customer_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
