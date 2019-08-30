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
  password: 'password'
)
bar_managers.push(bar_manager_gege)

bar_manager_andre = User.create(
  email: 'andre@bar.be',
  password: 'password'
)
bar_managers.push(bar_manager_andre)

bar_manager_eric = User.create(
  email: 'erice@bar.be',
  password: 'password'
)
bar_managers.push(bar_manager_eric)



puts "Creating artists"

artists = []

artist_gaspard = User.create(
  email: 'gaspard@artist.be',
  password: 'password'
)
artists.push(artist_gaspard)

artist_julie = User.create(
  email: 'julie@artist.be',
  password: 'password'
)
artists.push(artist_julie)

artist_james = User.create(
  email: 'james@artist.be',
  password: 'password'
)
artists.push(artist_james)

artist_richard = User.create(
  email: 'richard@artist.be',
  password: 'password'
)
artists.push(artist_richard)

artist_ila = User.create(
  email: 'ila@artist.be',
  password: 'password'
)
artists.push(artist_ila)

artist_sam = User.create(
  email: 'sam@artist.be',
  password: 'password'
)
artists.push(artist_sam)



# Profiles:

addresses = [



  'Boulevard de la Woluwe 22, 1150 Woluwe-Saint-Pierre',
  '',
  'Rue Belliard 4, 1040 Etterbeek',
  'Chaussée de Haecht 6, 1210 Saint-Josse-ten-Noode'
]

photo_gege = "https://source.unsplash.com/das6NrjLoM0/1300x780/"
photo_gaspard = "https://source.unsplash.com/_7LbC5J-jw4/1300x780/"
photo_julie = "https://source.unsplash.com/qJKT2rMU0VU/1300x780/"
photo_james = "https://source.unsplash.com/d2MSDujJl2g/1300x780/"
photo_richard = "https://source.unsplash.com/3POm-bxWIN8/1300x780/"
photo_ila = "https://source.unsplash.com/AgYOuy8kA7M/1300x780/"
photo_sam = "https://source.unsplash.com//Nxy-6QwGMzA/1300x780/"
photo_andre = "https://source.unsplash.com/lkMJcGDZLVs/1300x780/"
photo_eric = "https://source.unsplash.com/7omHUGhhmZ0/1300x780/"
puts "Creating profiles bar managers"


gege = bar_managers[0].profile
gege.username = "Gege"
gege.address = "Parvis De Saint-Gilles 40, 1060 Saint-Gilles"
gege.is_bar_manager = true
gege.remote_photo_url = photo_gege
gege.save!

andre = bar_managers[1].profile
andre.username = "Andre"
andre.address = "Avenue De Fré, 206 1180 Uccle"
andre.is_bar_manager = true
andre.remote_photo_url = photo_andre
andre.save!

eric = bar_managers[2].profile
eric.username = "Eric"
eric.address = "Boulevard Lambermont 364, 1030 Schaerbeek"
eric.is_bar_manager = true
eric.remote_photo_url = photo_eric
eric.save!



puts "Creating profiles artists"

gaspard = artists[0].profile
gaspard.username = 'Gaspard'
gaspard.address = "Rue de Savoie 42, 1060 Saint-Gilles"
gaspard.is_artist = true
gaspard.artist_description = "Street artist & photographer"
gaspard.remote_photo_url = photo_gaspard
gaspard.save!

julie = artists[1].profile
julie.username = 'Julie'
julie.address = "Place Sainte-Catherine 12, 1000 Bruxelles"
julie.is_artist = true
julie.artist_description = "Dancer & live-performer"
julie.remote_photo_url = photo_julie
julie.save!

james = artists[2].profile
james.username = 'James'
james.address = "Boulevard Anspach 24, 1000 Bruxelles"
james.is_artist = true
james.artist_description = "Digital artist"
james.remote_photo_url = photo_james
james.save!

richard = artists[3].profile
richard.username = 'Richard'
richard.address = "Rue du Vieux Marché aux Grains 20, 1000 Bruxelles"
richard.is_artist = true
richard.artist_description = "Photographer"
richard.remote_photo_url = photo_richard
richard.save!

ila = artists[4].profile
ila.username = 'Ila'
ila.address = "Place Saint-Gery 1, 1000 Bruxelles"
ila.is_artist = true
ila.artist_description = "Painter"
ila.remote_photo_url = photo_ila
ila.save!

sam = artists[5].profile
sam.username = 'Sam'
sam.address = "Avenue du Parc 10, 1060 Saint-Gilles"
sam.is_artist = true
sam.artist_description = "Painter"
sam.remote_photo_url = photo_sam
sam.save!

puts "Creating bars"


bars = []

bar_gege = Bar.new(
  name: "Chez Gege",
  description: "Everyone feels welcome at Chez Gege !",
  address: "16 Rue Berckmans, 1060 Saint-Gilles"
)
bar_gege.user = bar_managers[0]
bar_gege.save!
bars.push(bar_gege)

fgpic = Picture.new
fgpic.bar = bar_gege
fgpic.remote_photo_url =  "https://source.unsplash.com/_-E17t8_Rrw/1300x780/"
fgpic.save!

sgpic = Picture.new
sgpic.bar = bar_gege
sgpic.remote_photo_url =  "https://source.unsplash.com/pYXNCk8wpgw/1300x780/"
sgpic.save!

tgpic = Picture.new
tgpic.bar = bar_gege
tgpic.remote_photo_url =  "https://source.unsplash.com/6rgwUHMokWU/1300x780/"
tgpic.save!



bar_andre = Bar.new(
  name: "La taverne des bois",
  description: "Cosy bar with warm atmosphere. Organizing concerts for local artists. Discover new upcoming talent every week!",
  address: "Rue Belliard 4, 1040 Etterbeek"
)
bar_andre.user = bar_managers[1]
bar_andre.save!
bars.push(bar_andre)

fapic = Picture.new
fapic.bar = bar_andre
fapic.remote_photo_url =  "https://source.unsplash.com/GXXYkSwndP4/1300x780/"
fapic.save!

sapic = Picture.new
sapic.bar = bar_andre
sapic.remote_photo_url =  "https://source.unsplash.com/8x_fFNrmeDk/1300x780/"
sapic.save!

tapic = Picture.new
tapic.bar = bar_andre
tapic.remote_photo_url =  "https://source.unsplash.com/gj7BLlSzIFs/1300x780/"
tapic.save!

bar_eric = Bar.new(
  name: "Lockwood",
  description: "Perfect place for a night out, homemade cocktails and delicious food",
  address: "Avenue du Parc Royal 12, 1020 Bruxelles"
)
bar_eric.user = bar_managers[2]
bar_eric.save!
bars.push(bar_eric)

fapic = Picture.new
fapic.bar = bar_eric
fapic.remote_photo_url =  "https://source.unsplash.com/uqd-Eq1_TtE/1300x780/"
fapic.save!

sapic = Picture.new
sapic.bar = bar_eric
sapic.remote_photo_url =  "https://source.unsplash.com/OOfu_pkOkAo/1300x780/"
sapic.save!

tapic = Picture.new
tapic.bar = bar_eric
tapic.remote_photo_url =  "https://source.unsplash.com/H7xTpvBjJS4/1300x780/"
tapic.save!



puts "Creating events"

now = Time.now

events = []
chosen = []

bars.each do |bar|
  artists.each_with_index do |artist_user, i|
    # Event starting date between 2 days ago and 144 hours (6 days) from then: to still have more events in present
    random_start_date = now - 3.days + 60 * 60 * Random.rand(1..144)

    # Event duration between 1 - 8 hours
    random_end_date = random_start_date + 60 * 60 * Random.rand(1..8)
    event = Event.new(
      user: artist_user,
      bar: bar,
      name: Faker::Name.unique.last_name,
      start_date: random_start_date,
      end_date: random_end_date,
      description: Faker::Quote.matz,
      category: ["Concert", "Exhibition", "Performance"].sample
    )
    event.remote_photo_url = "https://source.unsplash.com/120#{i}x810/?performance"
    # event.save!
    events.push(event)
  end
end

def generate_random_unique_numbers_array(events_array)
  number_of_events = events_array.count
  origin_array = (1..number_of_events).to_a
  chosen_array = []
  9.times do
    chosen_number = origin_array.sample
    chosen_array << chosen_number
    origin_array.delete_if {|n| n == chosen_number}
  end
  return chosen_array
end

sample_event_indexes = generate_random_unique_numbers_array(events)

# puts events.count

sample_event_indexes.each do |i|
  # puts i
  event = events[i - 1]
  event.confirmed = true
  event.save!
  chosen << event
end

# 9.times do
#   event = events.sample
#   event.confirmed = true
#   event.save
#   chosen << event
# end

chosen[0].name = "Beyond the Sea"
chosen[0].description = "After travelling for more than a year, the artist has brought a collection of moving recollection of the journey."
chosen[0].remote_photo_url ="https://source.unsplash.com/Pp8JPEuSdU8/1300x780/"
chosen[0].save!

chosen[1].name = "Mind the gap"
chosen[1].description = "With this electro music concert of a new kind, be ready to embark on a mesmerizing journey..."
chosen[1].remote_photo_url ="https://source.unsplash.com/DZ0MfTX_9sQ/1300x780/"
chosen[1].save!

chosen[2].name = "Accoustic Live"
chosen[2].description = "Come and swing to the sound of south america"
chosen[2].remote_photo_url ="https://source.unsplash.com/fCEJGBzAkrU/1300x780/"
chosen[2].save!

chosen[3].name = "Along the road"
chosen[3].description = "Dance improvisation show with urban and multicultural references; a journey for the soul"
chosen[3].remote_photo_url ="https://source.unsplash.com/PVyhz0wmHdo/1300x780/"
chosen[3].save!

chosen[4].name = "Menia"
chosen[4].description = "A live performance at the crossing of theater, dance and street art"
chosen[4].remote_photo_url ="https://source.unsplash.com/JhqhGfX_Wd8/1300x780/"
chosen[4].save!

chosen[5].name = "Periode Blanche"
chosen[5].description = "Periode Blanche, a photography exhibition"
chosen[5].remote_photo_url ="https://source.unsplash.com/T_gAmymcQFs/1300x780/"
chosen[5].save!

chosen[6].name = "The Crows"
chosen[6].description = "Rap concert"
chosen[6].remote_photo_url ="https://source.unsplash.com/RLH_Wmlnj2k/1300x780/"
chosen[6].save!

chosen[7].name = "Lady Buttons"
chosen[7].description = "Surprising live performance show with many surprises..."
chosen[7].remote_photo_url ="https://source.unsplash.com/iD5aVJFCXJg/1300x780/"
chosen[7].save!

chosen[8].name = "Eyes"
chosen[8].description = "Photo exhibition reflecting the discovery of a new city by the eyes of a foreigner"
chosen[8].remote_photo_url ="https://source.unsplash.com/MHGDVDWjAb4/1300x780/"
chosen[8].save!

puts "adding reviews"

good_artist_reviews_array = [
  "Great bar, I loved working with the manager and taking the space !",
  "The people there were curious and lovely, it was a very nice encounter, I would totally recommend to consider partnering with them :heart:",
  "The place is just fantastic. I was really impressed ! A  lot of people came to the event, since the managers were trully involved and communicated about it. Fantastic experience",
  "I was scared to get out there, not absolutely confident about myself, and working withthese nice people really gave me the push i needed. A new event with them will be organised soon !",
  "Great collab, working with them was thrilling and easy, we had so much fuun and the people seemed to be very pleased about the event !"
]

shit_artist_reviews_array = [
  "This bar is a dump",
  "How can I showcase my true art when there is only 2 old ladies attending!?",
  "Me no understand what happen",
  "I was promised a big audience. It was full of cats and dogs...",
  "The manager thought I could be his friend. ME? HIS friend? Does he even know who I am ???? Nice joke..."
]

good_bar_reviews_array = [
  "I had an amazing time, the show was great, and the collaboration  was great  :sparkles:",
  "Creating this event really brought me a lot of new clientele ; besides, my regular customers were really curious and enthousiastic as well. I really liked it , would love to renew the experience.",
  "I was sceptical at first about having a performance from a young artist in my bar, afraid it would scare off my clientèle. What happenned is that not only were they pleasantly suprised, a lot of new clients came as well, attracted by the event ! I definately recommend working with this artist, had a great time.",
  "I feel like my bar has rejuvenated from this experience, had an amazing time !",
  "This experience helped me change the perception of my bar, rejuvenate the clientele on top of offering something new to my regular clients: I am absolutely satisfied and willing to organise a new event very soon !"
]

shit_bar_reviews_array = [
  "He didn't even show up",
  "This guy thinks he's a superstar",
  "I do not recommend this person",
  "The guy printed portraits of Jesus and glued them to my walls... wtf?",
  "He tried to do magic tricks, ended up breaking 2 tables and 10 glasses. Not reliable..."
]

n = 1

# from artist
chosen.each do |event|
  if n == 1
    review = Review.new(content: good_artist_reviews_array.sample, rating: rand(4..5))
    review.event = event
    review.user = event.user
    review.save!
    n += 1
  else
    review = Review.new(content: shit_artist_reviews_array.sample, rating: rand(2..3))
    review.event = event
    review.user = event.user
    review.save!
    n -= 1
  end
end

# from bars

chosen.each do |event|
  if n == 1
    review = Review.new(content: good_bar_reviews_array.sample, rating: rand(4..5))
    review.event = event
    review.user = event.bar.user
    review.save!
    n += 1
  else
    review = Review.new(content: shit_bar_reviews_array.sample, rating: rand(2..3))
    review.event = event
    review.user = event.bar.user
    review.save!
    n -= 1
  end
end


## PREVIOUS SEED

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# require 'open-uri'
# require 'time'

# puts "Destroying existing users/profiles/events/bars/pictures"
# User.destroy_all

# # Users:

# puts "Creating bar managers"

# bar_managers = []

# bar_manager_gege = User.create(
#   email: 'gege@bar.be',
#   password: 'gegebxl'
# )
# bar_managers.push(bar_manager_gege)

# 4.times do |i|
#   bar_manager = User.create(
#   email: "bar#{i + 2}@bar.be",
#   password: "bar#{i + 2}bxl"
#   )
#   bar_managers.push(bar_manager)
# end

# puts "Creating artists"

# artists = []

# artist_gaspard = User.create(
#   email: 'gaspard@artist.be',
#   password: 'gaspardbxl'
# )
# artists.push(artist_gaspard)

# 4.times do |i|
#   artist = User.create(
#   email: "artist#{i + 2}@artist.be",
#   password: "artist#{i + 2}bxl"
#   )
#   artists.push(artist)
# end

# puts "Creating personas"

# personas = []

# persona_balta = User.create(
#   email: 'balta@persona.be',
#   password: 'baltabxl'
# )
# personas.push(persona_balta)

# 4.times do |i|
#   persona = User.create(
#   email: "persona#{i + 2}@persona.be",
#   password: "persona#{i + 2}bxl"
#   )
#   personas.push(persona)
# end

# # Profiles:

# addresses = [
#   'Avenue Brugmann 40, 1190 Forest',
#   'Avenue De Fré, 206 1180 Uccle',
#   'Boulevard Lambermont 364, 1030 Schaerbeek',
#   'Place Sainte-Catherine 12, 1000 Bruxelles',
#   'Boulevard Anspach 24, 1000 Bruxelles',
#   'Rue du Vieux Marché aux Grains 20, 1000 Bruxelles',
#   'Place Saint-Gery 1, 1000 Bruxelles',
#   'Avenue du Parc 10, 1060 Saint-Gilles',
#   'Boulevard de la Woluwe 22, 1150 Woluwe-Saint-Pierre',
#   'Avenue du Parc Royal 12, 1020 Bruxelles',
#   'Rue Belliard 4, 1040 Etterbeek',
#   'Chaussée de Haecht 6, 1210 Saint-Josse-ten-Noode'
# ]

# photo_gege = "https://res.cloudinary.com/dx8gouewf/image/upload/v1566220564/g%C3%A9g%C3%A9_zazxnf.png"
# photo_gaspard = "https://i.pravatar.cc/"
# photo_balta = "https://res.cloudinary.com/dx8gouewf/image/upload/v1566252247/baltha_sgifjq.png"
# photo_random = "https://i.pravatar.cc/"

# puts "Creating profiles bar managers"

# # profile_gege = Profile.new(
# #   username: 'Bar gegegerard',
# #   address: 'Parvis De Saint-Gilles 40, 1060 Saint-Gilles',
# #   # photo: open(photo_gege),
# #   is_bar_manager: true
# # )
# # profile_gege.user = bar_managers[0]
# # profile_gege.remote_photo_url = photo_gege
# # profile_gege.save!

# gege = bar_managers[0].profile
# gege.username = "Gege"
# gege.address = "Parvis De Saint-Gilles 40, 1060 Saint-Gilles"
# gege.is_bar_manager = true
# gege.remote_photo_url = photo_gege
# gege.save!

# # 4.times do |i|
# #   profile_bar_manager = Profile.new(
# #     username: "Bar Manager #{i+2} #{Faker::Name.unique.last_name}",
# #     address: addresses[i],
# #     # photo: open(photo_random),
# #     is_bar_manager: true
# #   )
# #   profile_bar_manager.user = bar_managers[i + 1]
# #   profile_bar_manager.remote_photo_url = photo_random
# #   profile_bar_manager.save!
# # end

# 4.times do |i|
#   bar_manager = bar_managers[i + 1].profile
#   bar_manager.username = Faker::Name.unique.last_name
#   bar_manager.address = addresses[i]
#   bar_manager.is_bar_manager = true
#   bar_manager.remote_photo_url = photo_random
#   bar_manager.save!
# end

# puts "Creating profiles artists"

# # profile_gaspard = Profile.new(
# #   username: 'Artist gaspard',
# #   address: 'Rue de Savoie 42, 1060 Saint-Gilles',
# #   # photo: open(photo_gaspard),
# #   is_artist: true,
# #   artist_description: "I want to meet people, get a real human exchange, get comments on my work. I love to engage neighbourhood life."
# # )
# # profile_gaspard.user = artists[0]
# # profile_gaspard.remote_photo_url = photo_gaspard
# # profile_gaspard.save!

# gaspard = artists[0].profile
# gaspard.username = 'Gaspard'
# gaspard.address = "Rue de Savoie 42, 1060 Saint-Gilles"
# gaspard.is_artist = true
# gaspard.artist_description = "I want to meet people, get a real human exchange, get comments on my work. I love to engage neighbourhood life."
# gaspard.remote_photo_url = photo_gaspard
# gaspard.save!

# # 4.times do |i|
# #   profile_artist = Profile.new(
# #     username: "Artist #{i+2} #{Faker::Name.unique.last_name}",
# #     address: addresses[i+4],
# #     # photo: open(photo_random),
# #     is_artist: true,
# #     artist_description: Faker::GreekPhilosophers.quote
# #   )
# #   profile_artist.user = artists[i + 1]
# #   profile_artist.remote_photo_url = photo_random
# #   profile_artist.save!
# # end

# 4.times do |i|
#   artist = artists[i + 1].profile
#   artist.username = Faker::Artist.name
#   artist.address = addresses[i+4]
#   artist.is_artist = true
#   artist.artist_description = Faker::Quote.most_interesting_man_in_the_world
#   artist.remote_photo_url = photo_random
#   artist.save!
# end

# puts "Creating profiles personas"

# # profile_balta = Profile.new(
# #   username: 'Persona Balta',
# #   address: 'Rue Jourdan 30, 1060 Saint-Gilles',
# #   # photo: open(photo_balta)
# # )
# # profile_balta.user = personas[0]
# # profile_balta.remote_photo_url = photo_balta
# # profile_balta.save!

# balta = personas[0].profile
# balta.username = 'Balta'
# balta.address = 'Rue Jourdan 30, 1060 Saint-Gilles'
# balta.remote_photo_url = photo_balta
# balta.save!

# # 4.times do |i|
# #   profile_persona = Profile.new(
# #     username: "Persona #{i+2} #{Faker::Name.unique.last_name}",
# #     address: addresses[i+8]
# #     # photo: open(photo_random)
# #   )
# #   profile_persona.user = personas[i + 1]
# #   profile_persona.remote_photo_url = photo_random
# #   profile_persona.save!
# # end

# 4.times do |i|
#   persona = personas[i + 1].profile
#   persona.username = Faker::Name.unique.last_name
#   persona.address = addresses[i+8]
#   persona.remote_photo_url = photo_random
#   persona.save!
# end

# puts "Creating bars"

# photo_bar_random = "https://source.unsplash.com/1600x1080/?cafe"
# bar_pictures = [
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2815149_qmb18d.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2551794_afr9mh.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2813134_egi40g.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2813132_td4kmh.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2700533_mcgjdr.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2792902_l5abfe.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397710/pexels-photo-2788792_a9rbp7.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397709/pexels-photo-2642842_bri1wn.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397709/pexels-photo-2687131_kje9wh.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397709/pexels-photo-2277653_upxfaq.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397709/pexels-photo-2574474_dijhha.jpg",
#   "https://res.cloudinary.com/dx8gouewf/image/upload/v1566397709/pexels-photo-2612342_vwirxb.jpg"
# ]

# bar_names = [
#   'Moonlit Table Bar',
#   'Singing Lion Ale House',
#   'Chill Barman Parlor',
#   'Spirited Pint Hideout'
# ]

# bars = []

# bar_gege = Bar.new(
#   name: "Chez gege",
#   description: "Cosy bar promoting neighbourhood life. Organizing concerts for local artists. Discover new upcoming talent every week!",
#   address: "16 Rue Berckmans, 1060 Saint-Gilles"
# )
# bar_gege.user = bar_managers[0]
# bar_gege.save!
# bars.push(bar_gege)

# 3.times do |i|
#   pictures_bar_gege = Picture.new(bar: bar_gege)
#   # pictures_bar_gege.remote_photo_url = bar_pictures[i]
#   pictures_bar_gege.remote_photo_url = "https://source.unsplash.com/160#{i}x1080/?cafe"
#   pictures_bar_gege.save!
# end

# 4.times do |i|
#   bar = Bar.new(
#     name: Faker::Company.name,
#     # description: Faker::Lorem.paragraph(sentence_count: 7),
#     description: Faker::GreekPhilosophers.quote,
#     address: addresses[i+2]
#   )
#   bar.user_id = bar_managers[i+1].id
#   bar.save!
#   bars.push(bar)
#   5.times do |j|
#     pictures_bar = Picture.new(bar: bar)
#     pictures_bar.remote_photo_url = "https://source.unsplash.com/160#{j}x1080/?cafe"
#     pictures_bar.save!
#   end

# end

# puts "Creating events"

# now = Time.now

# events = []

# bars.each do |bar|
#   artists.each_with_index do |artist_user, i|
#     # Event starting date between 2 days ago and 144 hours (6 days) from then: to still have more events in present
#     random_start_date = now - 3.days + 60 * 60 * Random.rand(1..144)

#     # Event duration between 1 - 8 hours
#     random_end_date = random_start_date + 60 * 60 * Random.rand(1..8)
#     event = Event.new(
#       user: artist_user,
#       bar: bar,
#       name: Faker::Name.unique.last_name,
#       start_date: random_start_date,
#       end_date: random_end_date,
#       description: Faker::Quote.matz,
#       category: ["Concert", "Exhibition", "Performance"].sample
#     )
#     event.remote_photo_url = "https://source.unsplash.com/120#{i}x810/?performance"
#     event.save!
#     events.push(event)
#   end
# end
# 12.times do
#   event = events.sample
#   event.confirmed = true
#   event.save
# end

# puts "adding reviews"

# # from artist
# events.each do |event|
#   review = Review.new(content: Faker::Lorem.sentence, rating: rand(1..5))
#   review.event = event
#   review.user = event.user
#   review.save!
# end

# # from bars

# events.each do |event|
#   review = Review.new(content: Faker::Lorem.sentence, rating: rand(1..5))
#   review.event = event
#   review.user = event.bar.user
#   review.save!
# end









