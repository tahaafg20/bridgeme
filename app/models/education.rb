class Education < ApplicationRecord
    belongs_to :user
    has_many :posts
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
