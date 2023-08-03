# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ApplicationRecord.transaction do


#   User.new('yinyin','yinyin@gmail.com',1).save!
#   User.new('cat','cat@gmail.com',2).save!
#   User.new('dog','dog@gmail.com',3).save!


#   Artwork.new('flower','https://www.google.com/aclk?sa=l&ai=DChcSEwi7k43r2MCAAxXESHIKHTFvBoUYABAVGgJxdQ&ase=2&sig=AOD64_3Xn6lJRw2HUMHPVr5wdQid__Azwg&ctype=5&nis=5&adurl&ved=2ahUKEwjkofzq2MCAAxW-GVkFHfU9AIQQvhd6BQgBEKUB', 1).save!
#   Artwork.new('cat','https://i.pinimg.com/1200x/3c/c5/e9/3cc5e964cb4580b0f2828e2165f90158.jpg',2).save!
#   Artwork.new('cat','https://www.kalakari.in/wp-content/uploads/2020/01/Dogs-playing-pocker-1.jpg',3).save!


#   ArtworkShare.new(1,3).save!
#   ArtworkShare.new(2,3).save!
#   ArtworkShare.new(3,2).save!

# end
ApplicationRecord.transaction do
  puts "Preparing #{Rails.env} environment"

  # These `destroy_all` commands are not necessary if you use `rails
  # db:seed:replant`. If they are present when you run `db:seed:replant`,
  # however, the command will essentially just destroy the tables twice,
  # resulting in a small increase in execution time but no other ill effects.
  puts 'Destroying tables...'
  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all

  # Reset the id (i.e., primary key) counters for each table to start at 1
  # (helpful for debugging)
  puts 'Resetting id sequences...'
  %w(users artworks artwork_shares).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end


  user1 = User.create!(name: "user1")

  user2 = User.create!(name: "user2")
  user3 = User.create!(name: "user3")
  user4 = User.create!(name: "user4")
  user5 = User.create!(name: "user5")


  puts "Creating artworks..."

  artwork1 = Artwork.create!(title: "artwork1", img_url: "artwork1.com", artist_id: user1.id)
  artwork2 = Artwork.create!(title: "artwork2", img_url: "artwork2.com", artist_id: user2.id)
  artwork3 = Artwork.create!(title: "artwork3", img_url: "artwork3.com", artist_id: user3.id)
  artwork4 = Artwork.create!(title: "artwork4", img_url: "artwork4.com", artist_id: user4.id)
  artwork5 = Artwork.create!(title: "artwork5", img_url: "artwork5.com", artist_id: user5.id)

  puts "Creating artwork shares..."

  artwork_share1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user1.id)
  artwork_share2 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user2.id)
  artwork_share3 = ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: user3.id)
  artwork_share4 = ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: user4.id)
  artwork_share5 = ArtworkShare.create!(artwork_id: artwork5.id, viewer_id: user5.id)

  puts "Creating comments..."

  comment1 = Comment.create!(body: "comment1", user_id: user1.id, artwork_id: artwork1.id)
  comment2 = Comment.create!(body: "comment2", user_id: user2.id, artwork_id: artwork2.id)
  comment3 = Comment.create!(body: "comment3", user_id: user3.id, artwork_id: artwork3.id)
  comment4 = Comment.create!(body: "comment4", user_id: user4.id, artwork_id: artwork4.id)
  comment5 = Comment.create!(body: "comment5", user_id: user5.id, artwork_id: artwork5.id)
  comment6 = Comment.create!(body: "comment6", user_id: user1.id, artwork_id: artwork2.id)
  comment7 = Comment.create!(body: "comment7", user_id: user2.id, artwork_id: artwork3.id)
  comment8 = Comment.create!(body: "comment8", user_id: user3.id, artwork_id: artwork4.id)

  puts "Creating likes..."

  like1 = Like.create!(liker_id: user1.id, likeable_id: artwork1.id, likeable_type: "Artwork")
  like2 = Like.create!(liker_id: user2.id, likeable_id: artwork2.id, likeable_type: "Artwork")
  like3 = Like.create!(liker_id: user3.id, likeable_id: artwork3.id, likeable_type: "Artwork")
  like4 = Like.create!(liker_id: user4.id, likeable_id: artwork4.id, likeable_type: "Artwork")
  like5 = Like.create!(liker_id: user5.id, likeable_id: artwork5.id, likeable_type: "Artwork")
  like6 = Like.create!(liker_id: user1.id, likeable_id: comment1.id, likeable_type: "Comment")
  like7 = Like.create!(liker_id: user2.id, likeable_id: comment2.id, likeable_type: "Comment")
  like8 = Like.create!(liker_id: user3.id, likeable_id: comment3.id, likeable_type: "Comment")

  puts "Seeding complete!"

  puts "Done with #{Rails.env} environment!"
end


