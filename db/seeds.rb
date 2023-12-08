# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require "open-uri"
User.destroy_all
Venue.destroy_all
Event.destroy_all

puts "Creating User"

User.create!(email:"deon@gmail.com",password: "deonnn", first_name: "Deon", last_name:"Joshua", phone_number:"045 682 2686",image_url: "https://avatars.githubusercontent.com/u/114377143?v=4", dietary:"gluten-free")
User.create!(email: "wendy@gmail.com", password: "wendyy", first_name: "Wendy", last_name:"Henry", phone_number:"045 682 2686",image_url: "https://avatars.githubusercontent.com/u/30169541?v=4",dietary: "I don't have allergy. Can't tolerate beer sometime")
User.create!(email: "eliane@gmail.com", password: "eliane", first_name: "Eliane", last_name:"Fortes",  phone_number:"045 682 2686",image_url:"https://avatars.githubusercontent.com/u/133734998?v=4", dietary: "I like dairy and fruits")
User.create!(email: "francois@gmail.com", password: "francois", first_name: "Francois", last_name:"Francois",  phone_number:"045 682 2686", image_url:"https://avatars.githubusercontent.com/u/37090023?v=4", dietary: "No issue with anything. I like spicy food")
User.create!(email: "rama@gmail.com", password: "ramaaa", first_name: "Rama", last_name:"Komarudin", phone_number:"045 682 2686",image_url:"https://avatars.githubusercontent.com/u/25212852?v=4", dietary: "Not picky, no allergy")
User.create!(email: "hanh@gmail.com", password: "hanhaa", first_name: "Hanh", last_name:"Nguyen", phone_number:"045 682 2686",image_url:"https://avatars.githubusercontent.com/u/31459155?v=4", dietary: "Not picky, no allergy")
User.create!(email: "lachie@gmail.com", password: "lachie", first_name: "Lachie", last_name:"Barry", phone_number:"045 682 2686",image_url:"https://avatars.githubusercontent.com/u/146680210?v=4", dietary: "Not picky, no allergy")
User.create!(email: "menahil@gmail.com", password: "menahil", first_name: "Menahil", last_name:"Liaqat", phone_number:"045 682 2686",image_url:"https://avatars.githubusercontent.com/u/35796221?v=4", dietary: "Not picky, no allergy")
User.create!(email: "seha@gmail.com", password: "sehaaa", first_name: "Seha", last_name:"Sahin", phone_number:"045 682 2686",image_url:"https://i.pravatar.cc/150?img=64", dietary: "Not picky, no allergy")
User.create!(email: "matthew@gmail.com", password: "matheww", first_name: "Matthew", last_name:"Minier", phone_number:"045 682 2686",image_url:"https://i.pravatar.cc/150?img=64", dietary: "Not picky, no allergy")
User.create!(email: "ben@gmail.com", password: "bennnn", first_name: "Ben", last_name:"Schembri", phone_number:"045 682 2686",image_url:"https://i.pravatar.cc/150?img=64", dietary: "Not picky, no allergy")
User.create!(email: "cass@gmail.com", password: "cassss", first_name: "Cassandra", last_name:"Calescu", phone_number:"045 682 2686",image_url:"https://i.pravatar.cc/150?img=64", dietary: "Not picky, no allergy")
User.create!(email: "xabi@gmail.com", password: "xabiii", first_name: "Xabier", last_name:"Iruretagoyena", phone_number:"045 682 2686",image_url:"https://i.pravatar.cc/150?img=64", dietary: "Not picky, no allergy")
User.create!(email: "diana@gmail.com", password: "dianaa", first_name: "Diana", last_name:"Valadares", phone_number:"045 682 2686",image_url:"https://i.pravatar.cc/150?img=64", dietary: "Not picky, no allergy")
User.create!(email: "marcos@gmail.com", password: "marcos", first_name: "Marcos", last_name:"", phone_number:"045 682 2686",image_url:"https://i.pravatar.cc/150?img=64", dietary: "Not picky, no allergy")
User.create!(email: "marika@gmail.com", password: "marika", first_name: "Marika", last_name:"", phone_number:"045 682 2686",image_url:"https://i.pravatar.cc/150?img=64", dietary: "Not picky, no allergy")
User.create!(email: "hima@gmail.com", password: "himaaa", first_name: "Hima", last_name:"Perera", phone_number:"045 682 2686",image_url:"https://i.pravatar.cc/150?img=64", dietary: "Not picky, no allergy")

puts "User created"

require_relative 'venue.rb'

$venues_array.each do |p|
  Venue.create!(name: p[:name], description: p[:description], suburb: p[:suburb] , photo_url: p[:photo_url], country: p[:country], category: p[:category] ,phone_number: p[:phone_number] , email_address: p[:email_address] , website: p[:website], review: p[:review], capacity: p[:capacity_of_guest], price: p[:price_range] , rating: p[:rating] ,timeslot: p[:timeslot], operation_hour: p[:operation_hours], address:"#{p[:suburb]}, #{p[:country]}")
end

puts "venue loaded"
