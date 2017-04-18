# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# user1 = User.create(username: "Steve")
# user2 = User.create(username: "Bob")
# user3 = User.create(username: "Marsha")
#
# artwork1 = Artwork.create(title: "Nude Descending a Staircase", image_url: "Duchamp.com", artist_id: 1)
# artwork2 = Artwork.create(title: "Water Lily Pond", image_url: "monet.com", artist_id: 2)
#
# artwork_shares1 = ArtworkShare.create(viewer_id: 2, artwork_id: 1)
# artwork_shares2 = ArtworkShare.create(viewer_id: 1, artwork_id: 2)


artwork3 = Artwork.create(title: 'My child could make that', image_url: 'imfive.com', artist_id: 2)
comment1 = Comment.create(user_id: 1, artwork_id: 2, body: 'dopeness')
