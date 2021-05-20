class RoomSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :audition
  belongs_to :candidate
end
