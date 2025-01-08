class ResultSerializer < ActiveModel::Serializer
  attributes :hour, :number, :sign, :showed_at, :draw

  def sign
    if object.sign.nil?
      'N/A'
    else
      object.sign[0..2].upcase
    end
  end

  def draw
    object.draw.title
  end

  def showed_at
    object.created_at.strftime("%d/%m/%Y - %I:%M %p")
  end
end
