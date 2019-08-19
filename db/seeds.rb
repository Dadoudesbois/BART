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

bar_owner1 = User.create(
  email: 'gégé.gerard@bar.be',
  password: 'bar1bruxelles',
  address: 'Chaussée de Louvain 510, 1030 Schaerbeek'
)

bar_owner2 = User.create(
  email: 'bar_owner2@bar.be',
  password: 'bar2bruxelles',
  address: 'Place Sainte-Catherine 12, 1000 Bruxelles'
)

bar_owner3 = User.create(
  email: 'bar_owner3@bar.be',
  password: 'bar3bruxelles',
  address: 'Boulevard Anspach 24, 1000 Bruxelles'
)

bar_owners = [bar_owner1, bar_owner2, bar_owner3]

puts "Creating profiles"

photo_url1 = 'https://res.cloudinary.com/dx8gouewf/image/upload/v1566220564/g%C3%A9g%C3%A9_zazxnf.png'
photo_url2 = 'https://res.cloudinary.com/dx8gouewf/image/upload/v1565775771/qtw7khpdhemxtaax2wi6.svg'

profile1 = Profile.new(
  username: 'gégégerard',
  address: 'Chaussée de Louvain 510, 1030 Schaerbeek',
  photo: photo_url1
)

profile2 = Profile.new(
  username: 'bar2',
  address: 'Place Sainte-Catherine 12, 1000 Bruxelles',
  photo: photo_url2
)

profile3 = Profile.new(
  username: 'bar3',
  address: 'Boulevard Anspach 24, 1000 Bruxelles',
  photo: photo_url2
)


profile1.user = bar_owner1
profile2.user = bar_owner2
profile3.user = bar_owner3

profile1.save
profile2.save
profile3.save

puts "Creating bars"

addresses = [
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

1.times do |i|
  bar = Bar.new(
    name: Faker::Restaurant.name,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    address: addresses[i]
)
bar.user_id = bar_owners[i].id
bar.save!
end







