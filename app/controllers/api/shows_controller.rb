module Api
  class ShowsController < ApiController
    def show
      render json: ShowExtendedSerializer.represent(Show.find(params[:id]))
    end
  end
end
