module Api
  class MoviesController < ApiController
    def index
      render json: MovieSerializer.represent(Movie.all)
    end

    def show
      render json: MovieSerializer.represent(Movie.find(params[:id]))
    end
  end
end
