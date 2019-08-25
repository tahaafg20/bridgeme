class Post < ApplicationRecord
    belongs_to :user, required: false
    belongs_to :community, required: false
    belongs_to :health, required: false
    belongs_to :education, required: false
    searchkick
    belongs_to :ngo, required: false
    has_many_attached :images
    validates :content, presence: true
end
