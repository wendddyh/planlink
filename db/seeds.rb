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

User.create!(email:"deon@gmail.com",password: "deonnn", first_name: "Deon", last_name:"Joshua", phone_number:"12345",image_url: "https://i.pravatar.cc/150?img=68")
User.create!(email: "wendy@gmail.com", password: "wendyy", first_name: "Wendy", last_name:"Henry", phone_number:"12345",image_url: "https://i.pravatar.cc/150?img=46")
User.create!(email: "bob@gmail.com", password: "bobbbb", first_name: "Bob", last_name:"Marley",  phone_number:"12345",image_url:"https://i.pravatar.cc/150?img=65 ")
User.create!(email: "lucy@gmail.com", password: "lucyyy", first_name: "Lucy", last_name:"Santiago",  phone_number:"12345", image_url:"https://i.pravatar.cc/150?img=49")
User.create!(email: "john@gmail.com", password: "johnnn", first_name: "John", last_name:"Wick", phone_number:"12345",image_url:"https://i.pravatar.cc/150?img=64")

puts "User created"

require_relative 'venue.rb'

$venues_array.each do |p|
  Venue.create!(name: p[:name], description: p[:description], suburb: p[:suburb] , photo_url: p[:photo_url], country: p[:country], category: p[:category] ,phone_number: p[:phone_number] , email_address: p[:email_address] , website: p[:website], review: p[:review], capacity: p[:capacity_of_guest], price: p[:price_range] , rating: p[:rating] ,timeslot: p[:timeslot], operation_hour: p[:operation_hours], address:"#{p[:suburb]}, #{p[:country]}")
end

puts "venue loaded"
