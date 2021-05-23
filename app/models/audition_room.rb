class AuditionRoom < ApplicationRecord
    belongs_to :room
    belongs_to :audition
end
