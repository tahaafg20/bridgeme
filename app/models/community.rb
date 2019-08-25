class Community < ApplicationRecord
    belongs_to :user
    has_many :posts
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    searchkick 
        def search_data
        {
        name: name,
        address: address,
        services: services,
        country: country
        }
       end
    
end
