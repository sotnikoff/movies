require 'rails_helper'

RSpec.describe Api::MoviesController, type: :controller do
  before(:each) do
    @movie = create :movie
  end

  describe 'GET /api/movies' do
    it 'returns Movies' do
      get :index
      expect(response.status).to eq 200
      expect(response).to match_json_schema 'movies'
    end
  end

  describe 'GET /api/movies/:id' do
    it 'returns Movie' do
      get :show, params: { id: @movie.id }
      expect(response.status).to eq 200
      expect(response).to match_json_schema 'movie'
    end
  end
end
