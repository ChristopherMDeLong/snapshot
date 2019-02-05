# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
restaurants = [
  {
    name: "Longshore",
    address: "1077 Main Street",
    city: "Chatham",
    state: "MA",
    zip: "02633"
  },
  {
    name: "Arnold's",
    address: "3580 US-6",
    city: "Eastham",
    state: "MA",
    zip: "02642"
  },
  {
    name: "Chatham Squire",
    address: "487 Main Street",
    city: "Chatham",
    state: "MA",
    zip: "02633"
  },
  {
    name: "Del Mar",
    address: "907 Main Street",
    city: "Chatham",
    state: "MA",
    zip: "02633"
  }
]
restaurants.each do |restaurant|
  Restaurant.create!(
    name: restaurant[:name],
    address: restaurant[:address],
    city: restaurant[:city],
    state: restaurant[:state],
    zip: restaurant[:zip]
  )
end
