# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product = Product.create({name: "widget", price: 6, image_url: "placeholder.jpg", description: "blue, small, heavy"})
product = Product.create({name: "doorstop", price: 8, image_url: "placeholder.jpg", description: "gray, rubber, universal"})
product = Product.create({name: "lamp", price: 42, image_url: "placeholder.jpg", description: "nice, bright, pretty"})
product = Product.create({name: "toaster", price: 38, image_url: "placeholder.jpg", description: "efficient, compact, warranty"})