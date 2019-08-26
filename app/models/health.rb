class Health < ApplicationRecord
    belongs_to :user
    has_many :posts, dependent: :destroy
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
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
