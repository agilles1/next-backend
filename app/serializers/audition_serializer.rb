class AuditionSerializer < ActiveModel::Serializer
  attributes :id, :instrument, :date, :rooms
  has_many :candidates
  has_many :rooms


 end
