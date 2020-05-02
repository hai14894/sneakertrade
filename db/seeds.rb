# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
aus_state = ["NSW", "VIC", "WA", "TAS", "QLD", "NT"]
shoes_brand = ["adidas", "nike", "vans","converse","new balance"]
aus_state.each do |name|
    Location.create(state: name)
    puts "#{name} created"
end

20.times do |count|
    new_user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password)
    puts "User #{count} created"
    new_user.shoes.create(
        brand: shoes_brand.sample,
        model: Faker::Lorem.words,
        condition: [*(0..1)].sample,
        price: [*(100..500)].sample,
        description: Faker::Lorem.paragraph,
        location: Location.all.sample   
    )
end