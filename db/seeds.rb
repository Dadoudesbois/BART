# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'time'

puts "Destroying existing users/profiles/events/bars/pictures"
User.destroy_all

# Users:

puts "Creating bar managers"

bar_managers = []

bar_manager_gege = User.create(
  email: 'gege@bar.be',
  password: 'gegebxl'
)
bar_managers.push(bar_manager_gege)

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
  password: 'gaspardbxl'
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
  password: 'baltabxl'
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

photo_gege = "https://res.cloudinary.com/dx8gouewf/image/upload/v1566220564/g%C3%A9g%C3%A9_zazxnf.png"
photo_gaspard = "https://i.pravatar.cc/"
photo_balta = "https://res.cloudinary.com/dx8gouewf/image/upload/v1566252247/baltha_sgifjq.png"
photo_random = "https://i.pravatar.cc/"

puts "Creating profiles bar managers"

# profile_gege = Profile.new(
#   username: 'Bar gegegerard',
#   address: 'Parvis De Saint-Gilles 40, 1060 Saint-Gilles',
#   # photo: open(photo_gege),
#   is_bar_manager: true
# )
# profile_gege.user = bar_managers[0]
# profile_gege.remote_photo_url = photo_gege
# profile_gege.save!

gege = bar_managers[0].profile
gege.username = "Gege"
gege.address = "Parvis De Saint-Gilles 40, 1060 Saint-Gilles"
gege.is_bar_manager = true
gege.remote_photo_url = photo_gege
gege.save!

# 4.times do |i|
#   profile_bar_manager = Profile.new(
#     username: "Bar Manager #{i+2} #{Faker::Name.unique.last_name}",
#     address: addresses[i],
#     # photo: open(photo_random),
#     is_bar_manager: true
#   )
#   profile_bar_manager.user = bar_managers[i + 1]
#   profile_bar_manager.remote_photo_url = photo_random
#   profile_bar_manager.save!
# end

4.times do |i|
  bar_manager = bar_managers[i + 1].profile
  bar_manager.username = Faker::Name.unique.last_name
  bar_manager.address = addresses[i]
  bar_manager.is_bar_manager = true
  bar_manager.remote_photo_url = photo_random
  bar_manager.save!
end

puts "Creating profiles artists"

# profile_gaspard = Profile.new(
#   username: 'Artist gaspard',
#   address: 'Rue de Savoie 42, 1060 Saint-Gilles',
#   # photo: open(photo_gaspard),
#   is_artist: true,
#   artist_description: "I want to meet people, get a real human exchange, get comments on my work. I love to engage neighbourhood life."
# )
# profile_gaspard.user = artists[0]
# profile_gaspard.remote_photo_url = photo_gaspard
# profile_gaspard.save!

gaspard = artists[0].profile
gaspard.username = 'Gaspard'
gaspard.address = "Rue de Savoie 42, 1060 Saint-Gilles"
gaspard.is_artist = true
gaspard.artist_description = "I want to meet people, get a real human exchange, get comments on my work. I love to engage neighbourhood life."
gaspard.remote_photo_url = photo_gaspard
gaspard.save!

# 4.times do |i|
#   profile_artist = Profile.new(
#     username: "Artist #{i+2} #{Faker::Name.unique.last_name}",
#     address: addresses[i+4],
#     # photo: open(photo_random),
#     is_artist: true,
#     artist_description: Faker::GreekPhilosophers.quote
#   )
#   profile_artist.user = artists[i + 1]
#   profile_artist.remote_photo_url = photo_random
#   profile_artist.save!
# end

4.times do |i|
  artist = artists[i + 1].profile
  artist.username = Faker::Name.unique.last_name
  artist.address = addresses[i+4]
  artist.is_artist = true
  artist.artist_description = Faker::Quote.most_interesting_man_in_the_world
  artist.remote_photo_url = photo_random
  artist.save!
end

puts "Creating profiles personas"

# profile_balta = Profile.new(
#   username: 'Persona Balta',
#   address: 'Rue Jourdan 30, 1060 Saint-Gilles',
#   # photo: open(photo_balta)
# )
# profile_balta.user = personas[0]
# profile_balta.remote_photo_url = photo_balta
# profile_balta.save!

balta = personas[0].profile
balta.username = 'Balta'
balta.address = 'Rue Jourdan 30, 1060 Saint-Gilles'
balta.remote_photo_url = photo_balta
balta.save!

# 4.times do |i|
#   profile_persona = Profile.new(
#     username: "Persona #{i+2} #{Faker::Name.unique.last_name}",
#     address: addresses[i+8]
#     # photo: open(photo_random)
#   )
#   profile_persona.user = personas[i + 1]
#   profile_persona.remote_photo_url = photo_random
#   profile_persona.save!
# end

4.times do |i|
  persona = personas[i + 1].profile
  persona.username = Faker::Name.unique.last_name
  persona.address = addresses[i+8]
  persona.remote_photo_url = photo_random
  persona.save!
end

puts "Creating bars"

photo_bar_random = "https://source.unsplash.com/1600x1080/?cafe"
bar_pictures = [
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2815149_qmb18d.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2551794_afr9mh.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2813134_egi40g.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2813132_td4kmh.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2700533_mcgjdr.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2792902_l5abfe.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2788792_a9rbp7.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397709/pexels-photo-2642842_bri1wn.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397709/pexels-photo-2687131_kje9wh.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397709/pexels-photo-2277653_upxfaq.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397709/pexels-photo-2574474_dijhha.jpg",
  "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397709/pexels-photo-2612342_vwirxb.jpg"
]

bar_names = [
  'Moonlit Table Bar',
  'Singing Lion Ale House',
  'Chill Barman Parlor',
  'Spirited Pint Hideout'
]

bars = []

bar_gege = Bar.new(
  name: "Chez gege",
  description: "Cosy bar promoting neighbourhood life. Organizing concerts for local artists. Discover new upcoming talent every week!",
  address: "16 Rue Berckmans, 1060 Saint-Gilles"
)
bar_gege.user = bar_managers[0]
bar_gege.save!
bars.push(bar_gege)

3.times do |i|
  pictures_bar_gege = Picture.new(bar: bar_gege)
  # pictures_bar_gege.remote_photo_url = bar_pictures[i]
  pictures_bar_gege.remote_photo_url = "https://source.unsplash.com/160#{i}x1080/?cafe"
  pictures_bar_gege.save!
end

4.times do |i|
  bar = Bar.new(
    name: Faker::Company.name,
    # description: Faker::Lorem.paragraph(sentence_count: 7),
    description: Faker::GreekPhilosophers.quote,
    address: addresses[i+2]
  )
  bar.user_id = bar_managers[i+1].id
  bar.save!
  bars.push(bar)
  5.times do |j|
    pictures_bar = Picture.new(bar: bar)
    pictures_bar.remote_photo_url = "https://source.unsplash.com/160#{j}x1080/?cafe"
    pictures_bar.save!
  end

end

puts "Creating events"

now = Time.now

bars.each do |bar|
  artists.each_with_index do |artist_user, i|
    random_start_date = now + 60 * 60 * Random.rand(1..42)
    random_end_date = random_start_date + 60 * 60 * Random.rand(1..8)
    event = Event.new(
      user: artist_user,
      bar: bar,
      name: Faker::Book.title,
      start_date: random_start_date,
      end_date: random_end_date,
      description: Faker::Quote.matz
    )
    event.remote_photo_url = "https://source.unsplash.com/120#{i}x810/?performance"
    if i % 2 == 0
      event.confirmed = true
    end
    event.save!
  end
end












