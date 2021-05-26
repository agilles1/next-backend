class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :number, :name, :room

  def room

    if object.room
      room = {id: object.room.id, name: object.room.name}
      return room 
    end
    
  end


end
