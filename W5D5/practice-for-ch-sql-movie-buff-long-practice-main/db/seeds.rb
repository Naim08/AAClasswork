# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
  puts "Preparing #{Rails.env} environment"

  # These `destroy_all` commands are not necessary if you use `rails
  # db:seed:replant`. If they are present when you run `db:seed:replant`,
  # however, the command will essentially just destroy the tables twice,
  # resulting in a small increase in execution time but no other ill effects.
  ArtworkShare.destroy_all
  Artwork.destroy_all
  User.destroy_all

  puts "Creating users..."

  user1 = User.create!(name: "user1", email: "user1@email.com")

  user2 = User.create!(name: "user2", email: "user2@email.com")
  user3 = User.create!(name: "user3", email: "user3@email.com")
  user4 = User.create!(name: "user4", email: "user4@email.com")
  user5 = User.create!(name: "user5", email: "user5@email.com")


  puts "Creating artworks..."

  artwork1 = Artwork.create!(title: "artwork1", image_url: "artwork1.com", artist_id: user1.id)
  artwork2 = Artwork.create!(title: "artwork2", image_url: "artwork2.com", artist_id: user2.id)
  artwork3 = Artwork.create!(title: "artwork3", image_url: "artwork3.com", artist_id: user3.id)
  artwork4 = Artwork.create!(title: "artwork4", image_url: "artwork4.com", artist_id: user4.id)
  artwork5 = Artwork.create!(title: "artwork5", image_url: "artwork5.com", artist_id: user5.id)

  puts "Creating artwork shares..."

  artwork_share1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user1.id)
  artwork_share2 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user2.id)
  artwork_share3 = ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: user3.id)
  artwork_share4 = ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: user4.id)
  artwork_share5 = ArtworkShare.create!(artwork_id: artwork5.id, viewer_id: user5.id)

  puts "Seeding complete!"
end
