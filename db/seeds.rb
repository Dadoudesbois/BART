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
photo_julie = "https://source.unsplash.com/GBgp6Iy16lc/1300x780/"
photo_james = "https://source.unsplash.com/tHiGKAJxaA8/1300x780/"
photo_richard = "https://source.unsplash.com/_M6gy9oHgII/1300x780/"
photo_ila = "https://source.unsplash.com/7DD6tfTKqS4/1300x780/"
photo_sam = "https://source.unsplash.com/Ss3wTFJPAVY/1300x780/"

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

1gpic = Picture.new
1gpic.bar = bar_gege
1gpic.remote_photo_url =  "https://source.unsplash.com/_-E17t8_Rrw/1300x780/"
1gpic.save!

2gpic = Picture.new
2gpic.bar = bar_gege
2gpic.remote_photo_url =  "https://source.unsplash.com/pYXNCk8wpgw/1300x780/"
2gpic.save!

3gpic = Picture.new
3gpic.bar = bar_gege
3gpic.remote_photo_url =  "https://source.unsplash.com/6rgwUHMokWU/1300x780/"
3gpic.save!



bar_andre = Bar.new(
  name: "La taverne des bois",
  description: "Cosy bar with warm atmosphere. Organizing concerts for local artists. Discover new upcoming talent every week!",
  address: "Rue Belliard 4, 1040 Etterbeek"
)
bar_andre.user = bar_managers[0]
bar_andre.save!
bars.push(bar_andre)

1agpic = Picture.new
1apic.bar = bar_andre
1apic.remote_photo_url =  "https://source.unsplash.com/GXXYkSwndP4/1300x780/"
1apic.save!

2apic = Picture.new
2apic.bar = bar_andre
2apic.remote_photo_url =  "https://source.unsplash.com/8x_fFNrmeDk/1300x780/"
2apic.save!

3apic = Picture.new
3apic.bar = bar_andre
3apic.remote_photo_url =  "https://source.unsplash.com/gj7BLlSzIFs/1300x780/"
3apic.save!

bar_eric = Bar.new(
  name: "Lockwood",
  description: "Perfect place for a night out, homemade cocktails and delicious food",
  address: "Avenue du Parc Royal 12, 1020 Bruxelles"
)
bar_eric.user = bar_managers[0]
bar_eric.save!
bars.push(bar_eric)

1agpic = Picture.new
1apic.bar = bar_eric
1apic.remote_photo_url =  "https://source.unsplash.com/uqd-Eq1_TtE/1300x780/"
1apic.save!

2apic = Picture.new
2apic.bar = bar_eric
2apic.remote_photo_url =  "https://source.unsplash.com/OOfu_pkOkAo/1300x780/"
2apic.save!

3apic = Picture.new
3apic.bar = bar_eric
3apic.remote_photo_url =  "https://source.unsplash.com/H7xTpvBjJS4/1300x780/"
3apic.save!



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
    event.save!
    events.push(event)
  end
end
9.times do
  event = events.sample
  event.confirmed = true
  event.save
  chosen << event
end

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

# from artist
events.each do |event|
  review = Review.new(content: Faker::Quote.most_interesting_man_in_the_world, rating: rand(1..5))
  review.event = event
  review.user = event.user
  review.save!
end

# from bars

events.each do |event|
  review = Review.new(content: Faker::Quote.matz, rating: rand(1..5))
  review.event = event
  review.user = event.bar.user
  review.save!
end









