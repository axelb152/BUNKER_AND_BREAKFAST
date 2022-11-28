# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# SEED USERS

i = 0

while i < 20
  user = User.new
  user.email = Faker::Internet.email
  user.encrypted_password = Faker::Device.serial.to_s
  user.save!(validate: false)
  i += 1
end


# SEED BUNKERS


i = 0

bunkernames = ["The house of Armagedon",
  "Obama's Nest - Charming bunker in Pennsylvania",
  "The cigar cave - 4 bedrooms bunker",
  "Charming underground crib to chill while the world collapse",
  "Coding heaven - Great for coding in peace",
  "Ancient cooldwar missili silo, for history lovers",
  "The zombie apocalypse lair"
  ]

while i < 10
  bunker = Bunker.new
  bunker.user_id = User.all.sample.id
  bunker.name = bunkernames.sample
  bunker.description = Faker::Quote.matz
  bunker.price = rand(51.2...176.9)
  bunker.location = Faker::Address.full_address
  bunker.max_capacity = rand(4...14)
  bunker.save!
  i += 1
end


# SEED BOOKINGS / TO DO
