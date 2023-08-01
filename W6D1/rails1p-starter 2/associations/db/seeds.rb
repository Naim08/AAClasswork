# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  puts "Preparing #{Rails.env} environment"

  puts 'Destroying tables...'
  Like.delete_all
  Comment.delete_all
  Video.delete_all
  User.delete_all

  puts 'Resetting id sequences...'
  %w(users videos comments likes).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  puts 'Creating seed data...'
  gerald = User.create!(
    username: "cousin_gerald",
    password: "hesadoctor"
  )

  gillian = User.create!(
    username: "gillian",
    password: "ballberie"
  )

  tame_impala = Video.create!(
    title: "The Less I Know the Better",
    description: "Music by Australian band Tame Impala",
    uploader_id: gerald.id
  )

  pizzaball = Video.create!(
    title: "Ball of Pizza",
    description: "Eric brings pizza to the dojo",
    uploader_id: gillian.id
  )

  comment = Comment.create!(
    video_id: tame_impala.id,
    commenter_id: gillian.id,
    body: "first"
  )

  child_comment = Comment.create!(
    video_id: tame_impala.id,
    commenter_id: gerald.id,
    parent_comment_id: comment.id,
    body: "second"
  )

  like1 = Like.create!(liker_id: gillian.id, video_id: tame_impala.id)
  like2 = Like.create!(liker_id: gerald.id, video_id: pizzaball.id)
  
  puts "Done with #{Rails.env} environment!"
end