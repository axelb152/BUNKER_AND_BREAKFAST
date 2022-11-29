# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"


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
Bunker.destroy_all
bunkernames = ["The house of Armagedon",
  "Obama's Nest - Charming bunker in Pennsylvania",
  "The cigar cave - 4 bedrooms bunker",
  "Charming underground crib to chill while the world collapse",
  "Coding heaven - Great for coding in peace",
  "Ancient cooldwar missili silo, for history lovers",
  "The zombie apocalypse lair"]

  photos = ["The house of Armagedon",
  "Obama's Nest - Charming bunker in Pennsylvania",
  "The cigar cave - 4 bedrooms bunker",
  "Charming underground crib to chill while the world collapse",
  "Coding heaven - Great for coding in peace",
  "Ancient cooldwar missili silo, for history lovers",
  "The zombie apocalypse lair"]

while i < 10
  FILE = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  bunker = Bunker.new
  bunker.user_id = User.all.sample.id
  bunker.name = bunkernames.sample
  bunker.description = Faker::Quote.matz
  bunker.price = rand(51.2...176.9)
  bunker.location = Faker::Address.full_address
  bunker.max_capacity = rand(4...14)
  bunker.bedroom = 4
  bunker.bed = 4
  bunker.bathroom = 3
  bunker.category = "Large Bunker"
  bunker.cover_photo.attach(io: FILE, filename: "nes.png", content_type: "image/png")
  4.times {
  FILE = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
     bunker.photos.attach(io: FILE, filename: "nes.png", content_type: "image/png")}
  bunker.save!
  i += 1
end

# SEED BOOKINGS / TO DO
