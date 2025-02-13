class RaffleSerializer < ActiveModel::Serializer
  attributes :id, :award, :status, :winner, :place
  
  has_one :place

  def winner
    object.winner.present? ? object.winner : 'Esperando resultado...'
  end
end
