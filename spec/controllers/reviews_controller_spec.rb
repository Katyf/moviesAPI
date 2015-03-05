require 'rails_helper'
require 'byebug'
RSpec.describe ReviewsController do

  describe 'GET index' do
    it 'has a 200 status code' do
      @movie = Movie.last
      @reviews = @movie.reviews
      get :index, movie_id: @movie.id
      expect(response.status).to eq 200
    end

    it 'assigns @reviews' do
      @movie = Movie.last
      @reviews = @movie.reviews
      get :index, movie_id: @movie.id
      expect(assigns(:reviews)).to eq @reviews
    end
  end


  describe 'POST one review' do
    it 'saves a new review' do
      movie = Movie.create!(title: "The Avengers",
        total_gross: 623279547,
        release_date: "04-05-2012",
        MPAA_rating: "PG-13",
        description: "Nick Fury is director of S.H.I.E.L.D, an international peace keeping agency. The agency is a who's who of Marvel Super Heroes, with Iron Man, The Incredible Hulk, Thor, Captain America, Hawkeye and Black Widow. When global security is threatened by Loki and his cohorts, Nick Fury and his team will need all their powers to save the world from disaster.")
      review = Review.create(
        author: "Ashlinn",
        rating: 4,
        body: "It was good."
        )
      movie.reviews << review
      expect do
        post :create, movie: movie
      end
    end

    # it 'assigns @review' do
    #   movie = Movie.create!(title: "The Avengers",
    #     total_gross: 623279547,
    #     release_date: "04-05-2012",
    #     MPAA_rating: "PG-13",
    #     description: "Nick Fury is director of S.H.I.E.L.D, an international peace keeping agency. The agency is a who's who of Marvel Super Heroes, with Iron Man, The Incredible Hulk, Thor, Captain America, Hawkeye and Black Widow. When global security is threatened by Loki and his cohorts, Nick Fury and his team will need all their powers to save the world from disaster.")
    #   review = Review.create(
    #     author: "Ashlinn",
    #     rating: 4,
    #     body: "It was good."
    #     )
    #   movie.reviews << review
    #   post :create, movie_id: movie.id.to_i, review: review
    #   expect(assigns(:review)).to be_a_new Review
    #   expect(assigns(:review)).to be_persisted
    # end

  end

end
