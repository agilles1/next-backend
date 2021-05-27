class Candidate < ApplicationRecord
    has_one :candidate_room
    has_one :room, through: :candidate_room
    belongs_to :audition

    @@holding = Room.find_by(name: "Holding")
    @@green_room = Room.find_by(name: "Green Room")
    @@stage = Room.find_by(name: "Stage")

    def assign_room
        if Room.next_avail_room(self.audition)
            self.room = Room.next_avail_room(self.audition)
            self.save
        else 
            self.to_holding
        end
    end

    def assign_number
        self.audition.increase_counter
        self.number = self.audition.counter
        self.save
    end

    def update_room
        if self.in_holding?
            self.assign_room
        elsif !self.in_green_room? && !self.on_stage?
            self.on_deck 
            self.fill_behind
        elsif self.in_green_room?
            self.to_stage
            self.fill_behind_green_room
        elsif self.on_stage?
            self.clear_room
        else
            self.room
        end
        
    end



    def on_deck
        self.room = @@green_room
        self.save
    end

    def to_stage
        self.room = @@stage
        self.save
    end

    def to_holding
        self.room = @@holding
        self.save
    end

    def clear_room
        self.room = nil
        self.save
    end

    def fill_behind
        next_candidate = Candidate.find_by(number: self.number + self.audition.rooms.single_rooms.count, audition_id: self.audition_id)
        if next_candidate
            next_candidate.update_room
        end
    end

    def fill_behind_green_room
        next_candidate = Candidate.find_by(number: self.number + 1, audition_id: self.audition_id)
        if next_candidate
            next_candidate.update_room
        end
    end

    def on_stage?
        self.room == @@stage
    end

    def in_green_room?
        self.room == @@green_room
    end

    def in_holding?
        self.room == @@holding
    end

end
