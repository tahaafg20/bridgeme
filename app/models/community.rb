class Community < ApplicationRecord
    belongs_to :user
    has_many :posts
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
