require 'rails_helper'
require 'byebug'
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

  describe 'POST one movie' do
    it 'saves a new movie' do
      movie = Movie.create!(title: "The Avengers",
        total_gross: 623279547,
        release_date: "04-05-2012",
        MPAA_rating: "PG-13",
        description: "Nick Fury is director of S.H.I.E.L.D, an international peace keeping agency. The agency is a who's who of Marvel Super Heroes, with Iron Man, The Incredible Hulk, Thor, Captain America, Hawkeye and Black Widow. When global security is threatened by Loki and his cohorts, Nick Fury and his team will need all their powers to save the world from disaster.")
      expect do
        post :create, movie: movie
      end
    end

  #   it 'assigns @movie' do
  #     movie = Movie.create(title: "The Avengers",
  #       total_gross: 623279547,
  #       release_date: "04-05-2012",
  #       MPAA_rating: "PG-13",
  #       description: "Nick Fury is director of S.H.I.E.L.D, an international peace keeping agency. The agency is a who's who of Marvel Super Heroes, with Iron Man, The Incredible Hulk, Thor, Captain America, Hawkeye and Black Widow. When global security is threatened by Loki and his cohorts, Nick Fury and his team will need all their powers to save the world from disaster.")
  #     # binding.pry
  #     post :create, movie: movie
  #     expect(assigns(:movie)).to be_a Movie
  #     expect(assigns(:movie)).to be_persisted
  #   end
  end

  # describe 'PATCH one movie' do
  #   @movie = FactoryGirl.build(:movie, title: "The Avengars")
  #   it 'updates the requested movie' do
  #     patch :update, id: @movie.id, movie: FactoryGirl.attributes_for(:movie, title: "The Avengers")
  #       @movie.reload
  #       # @movie.title.should eq("Larry Johnson")
  #   end
  # end




end
