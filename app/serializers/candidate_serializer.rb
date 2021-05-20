class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :room, :number
  belongs_to :audition, serializer: AuditionSerializer
  has_one :room

end
