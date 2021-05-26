class Audition < ApplicationRecord
    has_many :candidates
    has_many :audition_rooms
    has_many :rooms, through: :audition_rooms
    scope :all_future_in_order, -> {where('date >= NOW()').order(:date)}

    def increase_counter
        self.counter += 1
        self.save
    end

    def self.new_with_rooms(audition_params)
        
        date = Time.parse(audition_params["date"] + " " + audition_params["time"])
        instrument = audition_params["instrument"]
        audition = Audition.new(date: date, instrument: instrument)

        if audition.save
           Room.new_from_audition(audition_params, audition)
        end

        return audition

    end

end
