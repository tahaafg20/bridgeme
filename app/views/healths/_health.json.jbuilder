json.extract! health, :id, :name, :number, :link, :email, :services, :about, :address, :latitude, :longitude, :created_at, :updated_at
json.url health_url(health, format: :json)
