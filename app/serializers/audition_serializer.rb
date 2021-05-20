class AuditionSerializer < ActiveModel::Serializer
  attributes :id, :instrument, :date
  has_many :candidates

end
