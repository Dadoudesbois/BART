# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "Destroying existing users :"
User.destroy_all

puts "Creating users"

bar_managers = []

bar_manager = User.create(
  email: 'gégé.gerard@bar.be',
  password: 'bargégébruxelles'
)

bar_managers.push(bar_manager)

9.times do |i|
  bar_manager = User.create(
  email: "bar#{i + 2}@bar.be",
  password: "bar#{i + 2}bruxelles"
  )
  bar_managers.push(bar_manager)
end

puts "Creating profiles"

addresses_profiles = [
  'Avenue Brugmann 40, 1190 Forest',
  'Avenue De Fré, 206 1180 Uccle',
  'Boulevard Lambermont 364, 1030 Schaerbeek',
  'Place Sainte-Catherine 12, 1000 Bruxelles',
  'Boulevard Anspach 24, 1000 Bruxelles',
  'Rue du Vieux Marché aux Grains 20, 1000 Bruxelles',
  'Place St. Gery 1, 1000 Bruxelles',
  'Avenue du Parc 10, 1060 Saint-Gilles',
  'Boulevard de la Woluwe 22, 1150 Woluwe-Saint-Pierre',
  'Avenue du Parc Royal 12, 1020 Bruxelles'
]

profiles = []

photo_url1 = 'https://res.cloudinary.com/dx8gouewf/image/upload/v1566220564/g%C3%A9g%C3%A9_zazxnf.png'
photo_url2 = 'https://res.cloudinary.com/dx8gouewf/image/upload/v1565775771/qtw7khpdhemxtaax2wi6.svg'

profile = Profile.new(
  username: 'gégégerard',
  address: 'Place St. Gery 1, 1000 Bruxelles',
  photo: photo_url1
)
profile.user = bar_managers[0]
profile.save!

profiles.push(profile)

9.times do |i|
  profile = Profile.new(
    username: "bar#{i+2}",
    address: addresses_profiles[i],
    photo: photo_url2
  )
  profile.user = bar_managers[i + 1]
  profile.save!
  profiles.push(profile)
end

puts "Creating bars"

addresses_bars = [
  'Rue Belliard 4, 1040 Etterbeek',
  'Chaussée de Haecht 6, 1210 Saint-Josse-ten-Noode',
  'Boulevard Louis Schmidt 8, 1040 Etterbeek',
  'Avenue du Parc 10, 1060 Saint-Gilles',
  'Boulevard de la Woluwe 22, 1150 Woluwe-Saint-Pierre',
  'Avenue du Parc Royal 12, 1020 Bruxelles',
  'Boulevard de la Plaine 14, 1050 Ixelles',
  'Boulevard Prince de Liège 16, 1070 Anderlecht',
  'Rue du Vieux Marché aux Grains 20, 1000 Bruxelles',
  'Place St. Gery 1, 1000 Bruxelles'
]

10.times do |i|
  bar = Bar.new(
    name: Faker::Restaurant.name,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    address: addresses_bars[i]
)
bar.user_id = bar_managers[i].id
bar.save!
end
