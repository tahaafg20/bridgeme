json.extract! ngo, :id, :name, :address, :number, :longitude, :latitude, :email, :services, :about, :status, :link, :accepted_documents, :created_at, :updated_at
json.url ngo_url(ngo, format: :json)
