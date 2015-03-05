require 'rails_helper'

describe 'Reviews Requests' do
  before(:all) do
    Movie.destroy_all
    FactoryGirl.create_list(:movie, 10)
    FactoryGirl.create_list(:review, 10)

  end

  describe '#index' do
    it 'gets all of the reviews for a movie' do
      @movie = Movie.first
      @reviews = @movie.reviews
      get "/movies/#{@movie.id}/reviews"
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq @reviews.length
    end
  end


  describe '#create' do
    it 'creates a review' do
      @movie = Movie.first
      post "/movies/#{@movie.id}/reviews",
      { review: {
        author: "Ashlinn",
        rating: 4,
        body: "It was good."
        } }.to_json,
        { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
        expect(response).to be_success
        expect(response.content_type).to be Mime::JSON

        review = JSON.parse(response.body)
        expect(review['author']).to eq "Ashlinn"
    end
  end

  # describe '#update' do
  #   it 'updates a movie' do
  #     @movie = Movie.first
  #     patch "/movies/#{@movie.id}",
  #     { movie: {
  #       title: "The Avengers",
  #       total_gross: 623279547,
  #       release_date: "04-05-2012",
  #       MPAA_rating: "PG-13",
  #       description: "Nick Fury is director of S.H.I.E.L.D, an international peace keeping agency. The agency is a who's who of Marvel Super Heroes, with Iron Man, The Incredible Hulk, Thor, Captain America, Hawkeye and Black Widow. When global security is threatened by Loki and his cohorts, Nick Fury and his team will need all their powers to save the world from disaster."
  #       } }.to_json,
  #       { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
  #       expect(response).to be_success
  #       expect(response.content_type).to be Mime::JSON

  #       movie = JSON.parse(response.body)
  #       expect(movie["title"]).to eq "The Avengers"
  #   end
  # end

end
