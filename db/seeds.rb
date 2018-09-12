# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
Supplier.create!([
  {name: "Homemade Inc.", email:"homemadewares@homemade.com", phone_number: "(555)444-3333"},
  {name: "Company Inc.", email:"products@company.com", phone_number: "(555)333-4444"},
  {name: "Manufacturers Inc.", email:"manufactured@manuf.com", phone_number: "(555)777-2222"}
])

Product.create!([
  {name: "widget", price: 6, image_url: "placeholder.jpg", description: "blue, small, heavy"},
  {name: "doorstop", price: 8, image_url: "placeholder.jpg", description: "gray, rubber, universal"},
  {name: "lamp", price: 42, image_url: "placeholder.jpg", description: "nice, bright, pretty"},
  {name: "toaster", price: 38, image_url: "placeholder.jpg", description: "efficient, compact, warranty"}
])
