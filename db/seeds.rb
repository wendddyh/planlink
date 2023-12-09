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

User.create!(email:"deon@gmail.com",password: "deonnn", first_name: "Deon", last_name:"Joshua", phone_number:"045 682 2686",image_url: "https://avatars.githubusercontent.com/u/114377143?v=4", dietary:"I prioritize organic and locally-sourced foods in my diet for sustainability.")
User.create!(email: "wendy@gmail.com", password: "wendyy", first_name: "Wendy", last_name:"Henry", phone_number:"045 682 2686",image_url: "https://avatars.githubusercontent.com/u/30169541?v=4",dietary: "I don't have allergy. Can't tolerate beer sometime")
User.create!(email: "eliane@gmail.com", password: "eliane", first_name: "Eliane", last_name:"Fortes",  phone_number:"045 682 2686",image_url:"https://avatars.githubusercontent.com/u/133734998?v=4", dietary: "I like dairy and fruits")
User.create!(email: "francois@gmail.com", password: "francois", first_name: "Francois", last_name:"Francois",  phone_number:"045 682 2686", image_url:"https://avatars.githubusercontent.com/u/37090023?v=4", dietary: "No issue with anything. I like spicy food")
User.create!(email: "rama@gmail.com", password: "ramaaa", first_name: "Rama", last_name:"Komarudin", phone_number:"045 682 2686",image_url:"https://avatars.githubusercontent.com/u/25212852?v=4", dietary: "I'm gluten-intolerant, so I avoid wheat, barley, and rye in my diet.")
User.create!(email: "hanh@gmail.com", password: "hanhaa", first_name: "Hanh", last_name:"Nguyen", phone_number:"045 682 2686",image_url:"https://avatars.githubusercontent.com/u/31459155?v=4", dietary: "Due to lactose intolerance, I opt for dairy-free alternatives.")
User.create!(email: "lachie@gmail.com", password: "lachie", first_name: "Lachie", last_name:"Barry", phone_number:"045 682 2686",image_url:"https://avatars.githubusercontent.com/u/146680210?v=4", dietary: "I follow a vegetarian diet and avoid meat and fish.")
User.create!(email: "menahil@gmail.com", password: "menahil", first_name: "Menahil", last_name:"Liaqat", phone_number:"045 682 2686",image_url:"https://avatars.githubusercontent.com/u/35796221?v=4", dietary: "As a vegan, I don't consume any animal products, including dairy and eggs.")
User.create!(email: "seha@gmail.com", password: "sehaaa", first_name: "Seha", last_name:"Sahin", phone_number:"045 682 2686",image_url:"https://ca.slack-edge.com/T02NE0241-U04CCEWT0R4-4217bf54907e-48", dietary: "I'm mindful of my carb intake, focusing on complex carbs like quinoa and sweet potatoes.")
User.create!(email: "matthew@gmail.com", password: "mathew", first_name: "Matthew", last_name:"Minier", phone_number:"045 682 2686",image_url:"https://ca.slack-edge.com/T02NE0241-U016JAY4B6Y-24d2b2b57bc7-48", dietary: "I have nut allergies, so I steer clear of all nuts and nut-based products.")
User.create!(email: "ben@gmail.com", password: "bennnn", first_name: "Ben", last_name:"Schembri", phone_number:"045 682 2686",image_url:"https://ca.slack-edge.com/T02NE0241-U03PRCNT3AR-832ae6874835-512", dietary:"For health reasons, I restrict my sodium intake and avoid high-salt foods.")
User.create!(email: "cass@gmail.com", password: "cassss", first_name: "Cassandra", last_name:"Calescu", phone_number:"045 682 2686",image_url:"https://ca.slack-edge.com/T02NE0241-US92115JM-9d291a64501d-48", dietary: "I adhere to a low-fat diet, avoiding fried and high-fat foods.")
User.create!(email: "xabi@gmail.com", password: "xabiii", first_name: "Xabier", last_name:"Iruretagoyena", phone_number:"045 682 2686",image_url:"https://res.cloudinary.com/ddmle7vip/image/upload/v1702033829/IMG_20230825_084622_01_1_wsqqik.jpg", dietary: "I'm on a low-carb diet, limiting my intake of starchy foods like bread and pasta.")
User.create!(email: "diana@gmail.com", password: "dianaa", first_name: "Diana", last_name:"Valadares", phone_number:"045 682 2686",image_url:"https://res.cloudinary.com/ddmle7vip/image/upload/v1702029794/Screenshot_2023-12-08-21-01-51-22_6012fa4d4ddec268fc5c7112cbb265e7_pa7wym.jpg", dietary: "I enjoy a Mediterranean diet, emphasizing olive oil, fish, and fresh produce.")
User.create!(email: "marcos@gmail.com", password: "marcos", first_name: "Marcos", last_name:"", phone_number:"045 682 2686",image_url:"https://res.cloudinary.com/ddmle7vip/image/upload/v1702032589/IMG-20231208-WA0002_h9jblg.jpg", dietary: "I aim for a high-protein diet to support my fitness goals, incorporating lean meats and legumes.")
User.create!(email: "marika@gmail.com", password: "marika", first_name: "Marika", last_name:"", phone_number:"045 682 2686",image_url:"https://res.cloudinary.com/ddmle7vip/image/upload/v1702033189/IMG-20231208-WA0004_y642z4.jpg", dietary: "My diet includes superfoods like berries, kale, and nuts for added nutritional value.")
User.create!(email: "hima@gmail.com", password: "himaaa", first_name: "Hima", last_name:"Perera", phone_number:"045 682 2686",image_url:"https://res.cloudinary.com/ddmle7vip/image/upload/v1702033544/IMG-20231208-WA0003_xqr93w.jpg", dietary: "I'm on a medically-prescribed diet that restricts sugar and processed foods.")
User.create!(email: "dane@gmail.com", password: "daneee", first_name: "Dane", last_name:"Joshua", phone_number:"045 682 2686",image_url:"https://res.cloudinary.com/ddmle7vip/image/upload/v1702087560/IMG-20231209-WA0005_sjtaxq.jpg", dietary: "My diet includes superfoods like berries, kale, and nuts for added nutritional value.")
User.create!(email: "tashya@gmail.com", password: "tashya", first_name: "Tashya", last_name:"Joshua", phone_number:"045 682 2686",image_url:"https://res.cloudinary.com/ddmle7vip/image/upload/v1702087560/IMG-20231209-WA0004_oackx4.jpg", dietary: "I'm on a medically-prescribed diet that restricts sugar and processed foods.")
puts "User created"

require_relative 'venue.rb'

$venues_array.each do |p|
  Venue.create!(name: p[:name], description: p[:description], suburb: p[:suburb] , photo_url: p[:photo_url], country: p[:country], category: p[:category] ,phone_number: p[:phone_number] , email_address: p[:email_address] , website: p[:website], review: p[:review], capacity: p[:capacity_of_guest], price: p[:price_range] , rating: p[:rating] ,timeslot: p[:timeslot], operation_hour: p[:operation_hours], address:"#{p[:suburb]}, #{p[:country]}")
end

puts "venue loaded"
