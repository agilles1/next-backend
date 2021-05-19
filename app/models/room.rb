class Room < ApplicationRecord
    has_one :candidate_room
    has_one :candidate, through: :candidate_room
    belongs_to :audition
    validates :fill_order, uniqueness: true 
    
        def self.next_avail_room
        available_rooms = []
        rooms = self.where('fill_order >= 2').order(:fill_order)
        rooms.each do |room|
            !room.candidate ? available_rooms.push(room) : nil
        end

        return available_rooms.first
    end
    
end
