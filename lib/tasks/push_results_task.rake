# lib/tasks/push_results_task.rake
desc 'Push results and set on database'
task push_results_task: :environment do
  current_time = Time.current
  current_hour = current_time.strftime('%H:00')

  zodiacs = %w[
    Aries Tauro Geminis Cancer Leo Virgo Libra Escorpio Sagitario Capricornio Acuario Piscis
  ].freeze

  Draw.includes(:schedules).find_each do |draw|
    next unless draw.schedules.exists?(hour: current_hour)
    next if draw.last_result_seen.strftime('%H:00') == current_hour

    if draw.last_result_seen.nil? || draw.key != 'rifamax'
      create_result_for_draw(draw, current_time, zodiacs)
    end
  end
end

private

def create_result_for_draw(draw, current_time, zodiacs)
  result_number = SecureRandom.random_number(1..999)
  zodiac_sign = draw.key == 'zodiac' ? zodiacs.sample : nil

  result = Result.new(number: result_number, sign: zodiac_sign, draw_id: draw.id, hour: current_time.strftime("%I:00 %p"), serie: draw.last_serie.nil? ? 1 : draw.last_serie + 1)

  if result.save
    draw.update_attribute :last_result_seen, Time.now
    draw.update_attribute :last_serie, draw.last_serie.nil? ? 1 : draw.last_serie + 1
  else
    Rails.logger.error "Failed to save result for draw ##{draw.id}."
    raise Exception.new("Failed to save result for draw ##{draw.id}.")
  end
end
  