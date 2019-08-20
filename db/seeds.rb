# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "Destroying existing users/events/bars"
User.destroy_all

# Users:

puts "Creating bar managers"

bar_managers = []

bar_manager_gégé = User.create(
  email: 'gégé.gerard@bar.be',
  password: 'bargégébxl'
)
bar_managers.push(bar_manager_gégé)

4.times do |i|
  bar_manager = User.create(
  email: "bar#{i + 2}@bar.be",
  password: "bar#{i + 2}bxl"
  )
  bar_managers.push(bar_manager)
end

puts "Creating artists"

artists = []

artist_gaspard = User.create(
  email: 'gaspard@artist.be',
  password: 'artistgaspardbxl'
)
artists.push(artist_gaspard)

4.times do |i|
  artist = User.create(
  email: "artist#{i + 2}@artist.be",
  password: "artist#{i + 2}bxl"
  )
  artists.push(artist)
end

puts "Creating personas"

personas = []

persona_balta = User.create(
  email: 'balta@persona.be',
  password: 'personabaltabxl'
)
personas.push(persona_balta)

4.times do |i|
  persona = User.create(
  email: "persona#{i + 2}@persona.be",
  password: "persona#{i + 2}bxl"
  )
  personas.push(persona)
end

# Profiles:

addresses = [
  'Avenue Brugmann 40, 1190 Forest',
  'Avenue De Fré, 206 1180 Uccle',
  'Boulevard Lambermont 364, 1030 Schaerbeek',
  'Place Sainte-Catherine 12, 1000 Bruxelles',
  'Boulevard Anspach 24, 1000 Bruxelles',
  'Rue du Vieux Marché aux Grains 20, 1000 Bruxelles',
  'Place Saint-Gery 1, 1000 Bruxelles',
  'Avenue du Parc 10, 1060 Saint-Gilles',
  'Boulevard de la Woluwe 22, 1150 Woluwe-Saint-Pierre',
  'Avenue du Parc Royal 12, 1020 Bruxelles',
  'Rue Belliard 4, 1040 Etterbeek',
  'Chaussée de Haecht 6, 1210 Saint-Josse-ten-Noode'
]

photo_gégé = "https://res.cloudinary.com/dx8gouewf/image/upload/v1566220564/g%C3%A9g%C3%A9_zazxnf.png"
photo_gaspard = "https://source.unsplash.com/200x200/?face"
photo_balta = "https://res.cloudinary.com/dx8gouewf/image/upload/v1566252247/baltha_sgifjq.png"
photo_random = "https://source.unsplash.com/200x200/?face"

puts "Creating profiles bar managers"

profile_gégé = Profile.new(
  username: 'gégégerard',
  name: 'Gégé',
  last_name: 'Gerard',
  address: 'Parvis De Saint-Gilles 40, 1060 Saint-Gilles',
  # photo: open(photo_gégé),
  is_bar_manager: true
)
profile_gégé.user = bar_managers[0]
profile_gégé.remote_photo_url = photo_gégé
profile_gégé.save!

4.times do |i|
  profile_bar_manager = Profile.new(
    username: "bar#{i+2}",
    name: "Bar Manager",
    last_name: Faker::Name.unique.last_name,
    address: addresses[i],
    # photo: open(photo_random),
    is_bar_manager: true
  )
  profile_bar_manager.user = bar_managers[i + 1]
  profile_bar_manager.remote_photo_url = photo_random
  profile_bar_manager.save!
end

puts "Creating profiles artists"

profile_gaspard = Profile.new(
  username: 'gaspard',
  name: 'FrouFrou',
  last_name: 'Gaspard',
  address: 'Rue de Savoie 42, 1060 Saint-Gilles',
  # photo: open(photo_gaspard),
  is_artist: true,
  artist_description: "I want to meet people, get a real human exchange, get comments on my work. I love to engage neighbourhood life."
)
profile_gaspard.user = artists[0]
profile_gaspard.remote_photo_url = photo_gaspard
profile_gaspard.save!

4.times do |i|
  profile_artist = Profile.new(
    username: "artist#{i+2}",
    name: "Artist",
    last_name: Faker::Music.band,
    address: addresses[i+4],
    # photo: open(photo_random),
    is_artist: true,
    artist_description: Faker::Lorem.paragraph(sentence_count: 7)
  )
  profile_artist.user = artists[i + 1]
  profile_artist.remote_photo_url = photo_random
  profile_artist.save!
end

puts "Creating profiles personas"

profile_balta = Profile.new(
  username: 'balta',
  name: 'Balta',
  last_name: 'Balthazard',
  address: 'Rue Jourdan 30, 1060 Saint-Gilles',
  # photo: open(photo_balta)
)
profile_balta.user = personas[0]
profile_balta.remote_photo_url = photo_balta
profile_balta.save!

4.times do |i|
  profile_persona = Profile.new(
    username: "persona#{i+2}",
    name: "Persona",
    last_name: Faker::Name.unique.last_name,
    address: addresses[i+8],
    # photo: open(photo_random)
  )
  profile_persona.user = personas[i + 1]
  profile_persona.remote_photo_url = photo_random
  profile_persona.save!
end

puts "Creating bars"

bar_names = [
  'Moonlit Table Bar',
  'Singing Lion Ale House',
  'Chill Barman Parlor',
  'Spirited Pint Hideout'
]

bar_gégé = Bar.new(
  name: "Chez Gégé",
  description: "Cosy bar promoting neighbourhood life. Organizing concerts for local artists. Discover new upcoming talent every week!",
  address: "16 Rue Berckmans, 1060 Saint-Gilles"
)
bar_gégé.user = bar_managers[0]
bar_gégé.save!

4.times do |i|
  bar = Bar.new(
    name: bar_names[i],
    description: Faker::Lorem.paragraph(sentence_count: 7),
    address: addresses[i+2]
)
bar.user_id = bar_managers[i+1].id
bar.save!
end
