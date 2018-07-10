module Api
  class MoviesController < ApiController
    before_action :find_movie, only: %i[show]
    def index
      render json: MovieSerializer.represent(Movie.extended_movies)
    end

    def show
      render json: combine_shows_and_movie
    end

    private

    def combine_shows_and_movie
      {
        movie: MovieExtendedSerializer.represent(@movie),
        shows: ShowSerializer.represent(@movie.shows.upcoming),
        halls: HallSerializer.represent(@movie.halls_for_upcoming_shows)
      }
    end

    def find_movie
      @movie = Movie.find(params[:id])
    end
  end
end
