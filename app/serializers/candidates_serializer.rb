class CandidatesSerializer < ActiveModel::Serializer
  attributes :id, :room, :number
  has_one :room

end
