class Candidate < ApplicationRecord
    has_one :candidate_room
    has_one :room, through: :candidate_room
    belongs_to :audition

    def assign_room
        self.room = Room.next_avail_room
        self.save
    end

    def on_deck
        self.room = Room.find_by(name: "Green Room")
        self.save
    end

    def to_stage
        self.room = Room.find_by(name: "Stage")
        self.save
    end

    def clear_room
        self.room = nil
        self.save
    end
end
