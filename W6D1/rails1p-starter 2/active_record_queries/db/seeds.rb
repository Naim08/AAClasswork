# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
  puts "Preparing #{Rails.env} environment"

  puts 'Destroying tables...'
  Actor.destroy_all
  Movie.destroy_all
  Casting.destroy_all

  puts 'Resetting id sequences...'
  %w(actors movies castings).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

	puts 'Loading actors...'
	require_relative 'data/actors.rb'
	puts 'Loading movies...'
	require_relative 'data/movies.rb'
	puts 'Loading castings...'
	require_relative 'data/castings.rb'
  
	puts "Done with #{Rails.env} environment!"
end