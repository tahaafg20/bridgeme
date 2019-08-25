class Health < ApplicationRecord
    belongs_to :user
    searchkick 
    def search_data
        {
        name: name,
        accepted_documents: accepted_documents,
        address: address,
        services: services 
        }
       end
end
