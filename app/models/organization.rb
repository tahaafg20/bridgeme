class Organization < ApplicationRecord
    belongs_to :user ,required: false
end
