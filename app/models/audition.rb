class Audition < ApplicationRecord
    has_many :candidates
    has_many :rooms

    def increase_counter
        self.counter += 1
        self.save
    end

    def self.new_with_rooms(params)
        datetime = 
        a = Audition.new(params["date"])
    end
    # "date"=>"11:00", "instrument"=>"test", "holding"=>true, "rooms"=>"255, 256, 257, 258"
end
