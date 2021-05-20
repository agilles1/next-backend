class Audition < ApplicationRecord
    has_many :candidates
    has_many :rooms

    def increase_counter
        self.counter += 1
        self.save
    end
    
end
