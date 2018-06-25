module Api
  class MoviesController < ApiController
    def index
      render json: Movie.all
    end

    def show
      render json: Movie.find(params[:id])
    end
  end
end
