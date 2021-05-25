class RoomSerializer < ActiveModel::Serializer
attributes :id, :name, :candidates
has_many :candidates

end
