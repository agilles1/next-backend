class AuditionSerializer < ActiveModel::Serializer
  attributes :id
  has_many :candidate
end