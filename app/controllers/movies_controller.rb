class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all

    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movies/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)
    
    # Code to check for bookmarking
    @list_of_bookmarks = Bookmark.where({:user_id => @current_user.id})
    @included_movie_ids = Array.new

    @list_of_bookmarks.each do |a_bookmark|
    @included_movie_ids.push(a_bookmark.movie_id)
    end
    
    render({ :template => "movies/show.html.erb" })
  end

  def create
    the_movie = Movie.new
    the_movie.title = params.fetch("query_title")
    the_movie.year = params.fetch("query_year")
    the_movie.duration = params.fetch("query_duration")
    the_movie.director_id = params.fetch("query_director_id")
    the_movie.description = params.fetch("query_description")
    the_movie.image = params.fetch("query_image")

    if the_movie.valid?
      the_movie.save
      redirect_to("/movies", { :notice => "Movie created successfully." })
    else
      redirect_to("/movies", { :notice => "Movie failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_movie = Movie.where({ :id => the_id }).at(0)

    the_movie.title = params.fetch("query_title")
    the_movie.year = params.fetch("query_year")
    the_movie.duration = params.fetch("query_duration")
    the_movie.director_id = params.fetch("query_director_id")
    the_movie.description = params.fetch("query_description")
    the_movie.image = params.fetch("query_image")

    if the_movie.valid?
      the_movie.save
      redirect_to("/movies/#{the_movie.id}", { :notice => "Movie updated successfully."} )
    else
      redirect_to("/movies/#{the_movie.id}", { :alert => "Movie failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_movie = Movie.where({ :id => the_id }).at(0)

    the_movie.destroy

    redirect_to("/movies", { :notice => "Movie deleted successfully."} )
  end
end
