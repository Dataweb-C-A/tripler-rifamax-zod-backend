class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :state, :location
end
