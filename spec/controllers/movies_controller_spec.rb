require 'rails_helper'

RSpec.describe MoviesController do

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'assigns @movies' do
      movies = Movie.all
      get :index
      expect(assigns(:movies)).to eq movies
    end
  end

  describe 'GET one movie' do
    it 'has a 200 status code' do
      movie = FactoryGirl.create(:movie)
      get :show, id: movie
      expect(response.status).to eq 200
    end
    it 'has a 200 status code' do
      movie = FactoryGirl.create(:movie)
      get :show, id: movie
      expect(assigns(:movie)).to eq movie
    end
  end

  # describe 'POST one post' do
  #   # it 'saves a new post' do
  #   #   expect do
  #   #     post :create, post:
  #   #   end
  #   # end

  #   it 'assigns @post' do
  #     post :create, post:
  #     expect(assigns(:post)).to be_a Post
  #     expect(assigns(:post)).to be_persisted
  #   end
  # end

end
