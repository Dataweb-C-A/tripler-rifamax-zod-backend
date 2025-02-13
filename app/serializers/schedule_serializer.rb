class ScheduleSerializer < ActiveModel::Serializer
  attributes :hour, :draw

  def hour
    object.hour.strftime("%H:%M")
  end

  def draw
    object.draw.title
  end
end
