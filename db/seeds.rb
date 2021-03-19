# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1000.times do
  status = rand(0..1) == 1 ? 'active' : 'inactive'
  User.create(title: Faker::Name.prefix, name: Faker::Name.unique.name, email: Faker::Internet.unique.email,
              phone: Faker::PhoneNumber.cell_phone_in_e164.gsub('+', ''), status: status)
end
