class Room < ApplicationRecord
    has_many :candidate_rooms
    has_many :candidates, through: :candidate_rooms
    has_many :audition_rooms
    has_many :auditions, through: :audition_rooms 

    scope :single_rooms, -> {where('holding == false').where('fill_order > 2').order(:fill_order)}
    scope :group_rooms, -> {where('holding == true').order(:fill_order)}

    
        def self.next_avail_room(audition)
        available_rooms = []
       
        rooms = audition.rooms.single_rooms

        rooms.each do |room|
         
            room.candidates.any? {|c| c.audition == audition} ? nil : available_rooms.push(room)
        end
                   
        available_rooms.first
        end

        def self.new_from_audition(audition_params, audition)
            rooms = Room.add_stage_green_room_holding(audition_params, audition)
            # Strip spaces and split on commas to give array of rooms in order of fill
            rooms_array = audition_params["rooms"].gsub(/\s+/, "").split(",")

            rooms_array.each_with_index do |room_name, i|
                room = Room.find_or_create_by(name: room_name)
                room.holding = false
                room.save
                AuditionRoom.create(audition_id: audition.id, room_id: room.id, fill_order: i+3)
            end
        end

        def self.add_stage_green_room_holding(audition_params, audition)
            green_room = Room.find_or_create_by(name: "Green Room")
            stage = Room.find_or_create_by(name: "Stage")
            holding = Room.find_or_create_by(name: "Holding")

            rooms = [stage, green_room, holding]

            rooms.each_with_index do |room, i|
                AuditionRoom.create(audition_id: audition.id, room_id: room.id, fill_order: i)
            end

            return rooms
        end

    
end
