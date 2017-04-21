# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.delete_all
band1 = Band.create(name: "First Band")
band2 = Band.create(name: "Second Band")

Album.delete_all
album1_1 = Album.create(name: "Album1-1", band_id: band1.id, album_type: "Live")
album1_2 = Album.create(name: "Album1-2", band_id: band1.id, album_type: "Studio")
album2_1 = Album.create(name: "Album2-1", band_id: band2.id, album_type: "Live")

Track.delete_all
track1_1_1= Track.create(name: "Track1-1-1", album_id: album1_1.id)
track1_1_2= Track.create(name: "Track1-1-2", album_id: album1_1.id)
track1_2_1= Track.create(name: "Track1-2-1", album_id: album1_2.id)
track1_2_2= Track.create(name: "Track1-2-2", album_id: album1_2.id)
track1_2_3= Track.create(name: "Track1-2-3", album_id: album1_2.id)
track2_1_1= Track.create(name: "Track2-1-1", album_id: album2_1.id)
track2_1_2= Track.create(name: "Track2-1-2", album_id: album2_1.id)
track2_1_3= Track.create(name: "Track2-1-3", album_id: album2_1.id)
track2_1_4= Track.create(name: "Track2-1-4", album_id: album2_1.id)
