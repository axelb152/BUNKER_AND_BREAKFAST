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

while i < 3
  user = User.new
  user.email = Faker::Internet.email
  user.encrypted_password = Faker::Device.serial.to_s
  user.save!(validate: false)
  i += 1
end

# SEED BUNKERS
Bunker.destroy_all

i = 0
bunkernames = ["The House of Armageddon - Asteroid safe",
 "Obama’s Getaway - Charming bunker in Pennsylvania",
 "The Cigar Cavern - 4 bedrooms bunker",
 "Rave Cave - better than Berghain",
 "Coding heaven - great for coding in peace",
 "Secret Coldwar missile silo - for history lovers",
 "The Zombie Apocalypse lair - free anti-serum on monthly bookings"]

 Cloudinary::Utils.cloudinary_url("development/" + "lsf9m4e0uz4r9no77km90kkjlxpv")

  photos = [
    "Screenshot_2022-11-30_at_13.16.35_zb9vrv",
    "Screenshot_2022-11-30_at_13.17.40_ltyv1s",
    "Screenshot_2022-11-30_at_13.14.54_thgmio",
    "Screenshot_2022-11-30_at_13.16.42_uxibuw",
    "Screenshot_2022-11-30_at_13.16.26_ot3ck1",
    "Screenshot_2022-11-30_at_13.16.49_e35v1c",
    "Screenshot_2022-11-30_at_13.15.21_p8bzvs",
    "Screenshot_2022-11-30_at_13.15.05_d5jku9",
    "Screenshot_2022-11-29_at_18.13.49_wfnave",
    "Screenshot_2022-11-30_at_13.15.12_weirib",
    "Screenshot_2022-11-29_at_18.14.00_ydt0j1",
    "Screenshot_2022-11-30_at_13.15.29_dpkpgo",
    "Screenshot_2022-11-29_at_18.13.35_pe9q0t"
    ]
while i < 5
  #FILES = URI.open( Cloudinary::Utils.cloudinary_url("development/" + "lsf9m4e0uz4r9no77km90kkjlxpv"))
  FILES = URI.open(Cloudinary::Utils.cloudinary_url("development/" + photos.sample))

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
  bunker.cover_photo.attach(io: FILES, filename: "nes.png", content_type: "image/png")
  4.times {
  FILE = URI.open(Cloudinary::Utils.cloudinary_url("development/" + photos.sample))
      bunker.photos.attach(io: FILE, filename: "nes.png", content_type: "image/png")}
  bunker.save!
  i += 1
end
