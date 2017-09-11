# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

200.times do
  reference_url = ReferenceUrl.new(associated_url: Faker::Internet.url)
  reference_url.mini_url = reference_url.generate_random_mini_url
  puts "=> Created url: #{reference_url.associated_url}. == mini url code is, #{reference_url.mini_url}"
  reference_url.save
end
