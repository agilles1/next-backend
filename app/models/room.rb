class Room < ApplicationRecord
    has_many :candidate_rooms
    has_many :candidates, through: :candidate_rooms
    belongs_to :audition
    validates :fill_order, uniqueness: true 
    scope :single_rooms, -> {where('holding == false').where('fill_order > 2').order(:fill_order)}
    scope :group_rooms, -> {where('holding == true').order(:fill_order)}

    
        def self.next_avail_room
        available_rooms = []

        rooms = self.single_rooms
    
        rooms.each do |room|
            room.candidates.length < 1 ? available_rooms.push(room) : nil
        end
                   
        available_rooms.first
        end


    
end
