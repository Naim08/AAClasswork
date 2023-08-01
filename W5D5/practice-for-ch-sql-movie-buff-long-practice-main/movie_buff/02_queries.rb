def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between 3 and 5
  # (inclusive). Show the id, title, year, and score.
  Movie.where(score: 3..5, yr: 1980..1989).select(:id, :title, :yr, :score)

end

def bad_years
  # List the years in which no movie with a rating above 8 was released.
  Movie.group(:yr).having("MAX(score) < 8").pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.

    Actor.joins(:movies).where(movies: {title: title}).order("castings.ord").select(:id, :name)

end

def vanity_projects
  # List the title of all movies in which the director also appeared as the
  # starring actor. Show the movie id, title, and director's name.

  Movie.select(:id, :title, :name).joins(:actors).where("castings.ord = 1 and castings.actor_id = movies.director_id")




end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name, and number of supporting roles.

    # Note: Joins castings twice to find the supporting roles.
    Actor.joins(:castings).where("castings.ord != 1").group(:id).order("COUNT(actors.id) DESC").limit(2).select(:id, :name, "COUNT(actors.id) AS roles")
end
