class Room < ApplicationRecord
    has_many :candidate_rooms
    has_many :candidates, through: :candidate_rooms
    belongs_to :audition 
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

        def self.new_from_audition(audition_params, audition)
            rooms = Room.add_stage_green_room_holding(audition_params, audition)
            # Strip spaces and split on commas to give array of rooms in order of fill
            rooms_array = audition_params["rooms"].gsub(/\s+/, "").split(",")

            rooms_array.each_with_index do |room_name, i|
                r = Room.find_or_create_by(name: room_name)
                r.fill_order = i + 3
                r.holding = false
                r.audition = audition
                r.save
                rooms.push(r)
            end

            return rooms
        end

        def self.add_stage_green_room_holding(audition_params, audition)
            green_room = Room.find_or_create_by(name: "Green Room")
            stage = Room.find_or_create_by(name: "Stage")
         
            rooms = [stage, green_room]

            if audition_params["holding"]
                holding = Room.find_or_create_by(name: "Holding")
                rooms.push(holding)
            end

            rooms.each do |room |
                room.audition = audition
                room.save
            end

            return rooms
        end

    
end
