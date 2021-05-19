class Room < ApplicationRecord
    has_one :candidate_room
    has_one :candidate, through: :candidate_room
    belongs_to :audition
    

    def self.next_avail_room
        available_rooms = []
        rooms = self.all.order(:order)

        rooms.each do |room|
            !room.candidate ? available_rooms.push(room) : nil
        end
        
        return available_rooms.first
    end
    
end
