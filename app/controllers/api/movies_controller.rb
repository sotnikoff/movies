module Api
  class MoviesController < ApiController
    def index
      render json: Movie.all.map { |movie| MovieEntity.new(movie) }
    end

    def show
      render json: MovieEntity.new(Movie.find(params[:id]))
    end
  end
end
