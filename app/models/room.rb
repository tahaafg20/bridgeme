class Room < ApplicationRecord

    belongs_to :user
    has_many_attached :images
    has_one_attached :cover
    has_many :reservations
  
    has_many :guest_reviews
    has_many :calendars
  
  
    validates :home_type, presence: true
    validates :room_type, presence: true
    validates :accommodate, presence: true
    validates :bed_room, presence: true
    validates :bath_room, presence: true
    
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    
  
    def average_rating
      guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
    end
end
