module Api
  class MoviesController < ApiController
    before_action :movie, only: %i[show]
    def index
      render json: MovieSerializer.represent(Movie.extended_movies)
    end

    def show
      render json: MovieExtendedSerializer.represent(@movie)
    end

    private

    def movie
      @movie ||= Movie.find(params[:id])
    end
  end
end
