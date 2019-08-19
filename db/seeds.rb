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

bar_owner1.save
bar_owner2.save
bar_owner3.save

puts "Creating profiles"

profile1 = Profile.new(
  username: 'gégégerard',
  address: 'Chaussée de Louvain 510, 1030 Schaerbeek'
  # photo:
)

profile2 = Profile.new(
  username: 'bar2',
  address: 'Place Sainte-Catherine 12, 1000 Bruxelles'
)

profile3 = Profile.new(
  username: 'bar3',
  address: 'Boulevard Anspach 24, 1000 Bruxelles'
)

photo_url1 = 'https://res.cloudinary.com/dx8gouewf/image/upload/v1566220564/g%C3%A9g%C3%A9_zazxnf.png'
photo_url2 = 'https://res.cloudinary.com/dx8gouewf/image/upload/v1565775771/qtw7khpdhemxtaax2wi6.svg'
photo_url3 = 'https://res.cloudinary.com/dx8gouewf/image/upload/v1565775771/qtw7khpdhemxtaax2wi6.svg'

profile1.user = bar_owner1
profile2.user = bar_owner2
profile3.user = bar_owner3

profile1.remote_photo_url = open(photo_url1)
profile2.remote_photo_url = open(photo_url2)
profile3.remote_photo_url = open(photo_url3)

profile1.save
profile2.save
profile3.save

puts "Creating bars"

10.times do |i|
  bar + i = Bar.new(
    name: Faker::Restaurant.name,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)
)





