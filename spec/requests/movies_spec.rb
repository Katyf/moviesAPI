require 'rails_helper'

describe 'Movie Requests' do
  before(:all) do
    Movie.destroy_all
    FactoryGirl.create_list(:movie, 10)
  end

  describe '#index' do
    it 'gets all of the movies' do
      get '/movies'
      expect(response).to be_success
      expect(Movie.count).to eq 10
      json = JSON.parse(response.body)
      expect(json.length).to eq 10
    end
  end

  describe '#show' do
    it 'gets one movie' do
      movie = FactoryGirl.create(:movie)
      get "/movies/#{movie.id}"
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'creates a movie' do
      post '/movies/',
      { movie: {
        title: "The Avengers",
        total_gross: 623279547,
        release_date: "04-05-2012",
        MPAA_rating: "PG-13",
        description: "Nick Fury is director of S.H.I.E.L.D, an international peace keeping agency. The agency is a who's who of Marvel Super Heroes, with Iron Man, The Incredible Hulk, Thor, Captain America, Hawkeye and Black Widow. When global security is threatened by Loki and his cohorts, Nick Fury and his team will need all their powers to save the world from disaster."
        } }.to_json,
        { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
        expect(response).to be_success
        expect(response.content_type).to be Mime::JSON

        movie = JSON.parse(response.body)
        expect(movie["title"]).to eq "The Avengers"
    end
  end

  # describe '#update' do
  #   it 'updates a post' do
  #     @post = Post.first
  #     patch "/movies/#{@post.id}",
  #     { post: {
  #       title: "Bob Loblaw's Law Blog",
  #       author: "Bob Loblaw",
  #       body: "A husband and a wife cannot be convicted of the same crime"
  #       } }.to_json,
  #       { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
  #       expect(response).to be_success
  #       expect(response.content_type).to be Mime::JSON

  #       post = JSON.parse(response.body)
  #       expect(post["author"]).to eq "Bob Loblaw"
  #   end
  # end

  # describe '#destroy' do
  #   it 'DESTROYS A MOVIE' do
  #     @post = Post.first
  #     delete "/movies/#{@post.id}"
  #     expect(response.status).to eq 202

  #     movies = JSON.parse(response.body)
  #     expect(movies.length).to eq 9
  #   end
  # end

end
