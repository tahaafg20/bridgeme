class Community < ApplicationRecord
    belongs_to :user
    has_many :posts
    searchkick
end
