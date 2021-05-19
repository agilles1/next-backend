class Audition < ApplicationRecord
    has_many :candidates
    has_many :rooms
end
