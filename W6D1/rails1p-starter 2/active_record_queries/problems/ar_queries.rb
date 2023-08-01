# == Schema Information
#
# Table name: actors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  yr          :integer          not null
#  score       :float            not null
#  votes       :integer          not null
#  director_id :bigint           
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Table name: castings
#
#  id         :bigint           not null, primary key
#  actor_id   :bigint           not null
#  movie_id   :bigint           not null
#  ord        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null

# IMPORTANT:
# For all of the following problems return an ActiveRecord::Relation unless
# otherwise specified. 

def lowest_score
  # Find the id and title of movies with scores lower than 2
  
end

def wesley_movies
  # Find the id, title, and score of all the movies the actor Wesley Snipes
  # was in.

end

def meg_movies
  # Find the id, title, and year of all the movies Meg Ryan has acted in.
  # Order them in ascending order by year.

end

def susan_supporting_roles
  # Find the id and title of all movies in which Susan Sarandon
  # appeared but not as a lead actor.

  # Reminder: In the castings table, the lead actor for a movie will
  # have ord = 1 

end

def biggest_cast
  # Find the id and title of the 3 movies with the largest casts (i.e., the most
  # actors)

end