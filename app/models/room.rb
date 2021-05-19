class Room < ApplicationRecord
    has_many :candidate_rooms
    has_many :candidates, through: :candidate_rooms
    belongs_to :audition

    
end
