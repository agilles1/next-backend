class Candidate < ApplicationRecord
    has_one :candidate_room
    has_one :room, through: :candidate_room
    belongs_to :audition
    
    def on_deck()

    end

    def assign_room()

    end
end
