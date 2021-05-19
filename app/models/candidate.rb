class Candidate < ApplicationRecord
    has_many :candidate_rooms
    has_many :rooms, through: :candidate_rooms
    belongs_to :audition
    
end
