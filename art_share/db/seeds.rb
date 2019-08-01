# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  # Users
  kevin = User.create!(username: 'kevin')
  aaron = User.create!(username: 'aaron')
  mike = User.create!(username: 'mike')
  sam = User.create!(username: 'sam')

  # Artworks
  artwork_1 = Artwork.create!(title: 'starry night', artist_id: kevin.id, image_url: 'yeah')
  artwork_2 = Artwork.create!(title: 'dark night', artist_id: aaron.id, image_url: 'yeah')
  artwork_3 = Artwork.create!(title: 'dark knight', artist_id: aaron.id, image_url: 'yeah')
  artwork_4 = Artwork.create!(title: 'untitled', artist_id: sam.id, image_url: 'yeah')

  # Shares
  s1 = ArtworkShare.create!(artwork_id: artwork_4.id, viewer_id: kevin.id)
  s2 = ArtworkShare.create!(artwork_id: artwork_1.id, viewer_id: aaron.id)
  s3 = ArtworkShare.create!(artwork_id: artwork_2.id, viewer_id: mike.id)
  s4 = ArtworkShare.create!(artwork_id: artwork_3.id, viewer_id: mike.id)
  s5 = ArtworkShare.create!(artwork_id: artwork_2.id, viewer_id: kevin.id)

end