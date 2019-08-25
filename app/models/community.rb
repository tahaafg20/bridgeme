class Community < ApplicationRecord
    belongs_to :user
    searchkick 
    def search_data
        {
        name: name,
        address: address,
        services: services 
        }
       end
end
