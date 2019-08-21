class Room < ApplicationRecord
  enum instant: {Request: 0, Instant: 1}
    has_many_attached :images
    has_one_attached :cover
    searchkick
    belongs_to :user
    has_many :reservations
    has_many :guest_reviews
    has_many :calendars
    def search_data
      {
        address: address,
        summary: summary,
        price: price,
        listing_name: listing_name
      }
    end
  
<<<<<<< HEAD
    
    validates :room_type, presence: true
    validates :accommodate, presence: true

    validates :bath_room, presence: true
=======
    validates :room_type, presence: true
    validates :accommodate, presence: true
>>>>>>> 4b67a3b044f8004d4e8a3337ac14b285ebe22d88
    
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    
  
    def average_rating
      guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
    end
end
