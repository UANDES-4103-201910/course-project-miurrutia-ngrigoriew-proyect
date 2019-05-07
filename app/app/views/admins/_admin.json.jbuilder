json.extract! admin, :id, :name, :lastname, :email, :password, :geofence, :created_at, :updated_at
json.url admin_url(admin, format: :json)
