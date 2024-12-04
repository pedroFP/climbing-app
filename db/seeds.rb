# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
ClimbingPlace.destroy_all

user = User.create! do |u|
  u.name = "user"
  u.email = "123@123.com"
  u.password = "123123"
  u.password_confirmation = "123123"
end


10.times do
  latitude = 32.0 + rand * (38.0 - 32.0) # Random number between 37.0 and 38.0
  longitude = -90.0 + rand * (90.0 - 80.0) # Random number between -122.0 and -121.0

  ClimbingPlace.new(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraphs(number: 10).join(''),
    latitude: latitude,
    longitude: longitude,
    user_id: user.id,
    country_code: [ "US", "CL", "PT" ].sample,
  ).save(validate: false)
end

puts "Seeds created!"
