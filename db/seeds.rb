# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
puts "Cleaning database..."
Review.destroy_all
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = Restaurant.create(name: "Dishoom", address: "7 Boundary St, London E2 7JE", phone_number: "0606060606", category: "french")
pizza_east = Restaurant.create(name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", phone_number: "0706060606", category: "italian")

[dishoom, pizza_east].each do |restaurant|
  puts "Created #{restaurant.name}"
end
puts "Finished!"

puts "Reviews creating"
p dishoom
review = Review.new(content: "C'est tres bon", rating: 4, restaurant_id: dishoom.id)
review.save!

review = Review.new(content: "C'est ULTRA tres bon", rating: 5, restaurant_id: pizza_east.id)
review.save!
puts "Reviews done"
