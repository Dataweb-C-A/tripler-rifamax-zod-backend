# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

draws = [
  {
    id: 1,
    title: "Triple Rifamax Zodiacal A",
    key: "TRZ-A",
    draw: "Triple",
    length: 3
  }, 
  {
    id: 2,
    title: "Triple Rifamax Zodiacal B",
    key: "TRZ-B",
    draw: "Triple",
    length: 3
  }, 
  {
    id: 3,
    title: "Triple Rifamax Zodiacal C",
    key: "TRZ-C",
    draw: "Triple",
    length: 3
  }, 
  {
    id: 4,
    title: "Rifamax Zodiacal",
    key: "zodiac",
    draw: "Zodiacal",
    length: 3
  },
  {
    id: 5,
    title: "Rifamax",
    key: "rifamax",
    draw: "Rifamax",
    length: 4
  }
]

available_hours = [
  '13:00',
  '17:00',
  '21:00'
]

filtered_draws = ["Triple", "Zodiacal"]

draws.each do |draw|
  Draw.create(title: draw[:title], key: draw[:key], draw: draw[:draw], length: draw[:length])

  if filtered_draws.include?(draw[:draw])
    available_hours.each do |hour|
      Schedule.create(hour: hour, draw_id: draw[:id])
    end
  end
end

Schedule.create(hour: '22:00', draw_id: 5)
