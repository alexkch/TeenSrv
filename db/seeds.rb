# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
	{ username: 'talat@gmail.com', password: 'password', password_confirmation: 'password', usertype: 0 },
	{ username: 'alex@gmail.com', password: 'password', password_confirmation: 'password', usertype: 0 },
	{ username: 'ric@gmail.com', password: 'password', password_confirmation: 'password', usertype: 1 },
	{ username: 'maithri@gmail.com', password: 'password', password_confirmation: 'password', usertype: 1 },
	{ username: 'chloe@gmail.com', password: 'password', password_confirmation: 'password', usertype: 0 },
	{ username: 'robart@gmail.com', password: 'password', password_confirmation: 'password', usertype: 0 }	
	])
