# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

 users = []
 
 10.times  do

 	users << User.create(password: "1", name: Faker::Name.first_name, email: Faker::Internet.email)

 	end

 	beers = []

 	25.times do

 		users << Beer.create(name:Faker::Beer.name, style:Faker::Beer.style, alcohol:Faker::Beer.alcohol)
 	
 	end