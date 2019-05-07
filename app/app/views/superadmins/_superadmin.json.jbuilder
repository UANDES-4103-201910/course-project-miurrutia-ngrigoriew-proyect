json.extract! superadmin, :id, :name, :lastname, :email, :password, :geofence, :created_at, :updated_at
json.url superadmin_url(superadmin, format: :json)
