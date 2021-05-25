class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :number, :name, :room

  def room
 
    room = {id: object.room.id, name: object.room.name}
    return room 
  end


end
