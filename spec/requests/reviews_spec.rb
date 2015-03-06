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

  describe '#update' do
    it 'updates a review and return the review' do
      @review = Review.first
      patch "/admin/reviews/#{@review.id}",
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

  describe '#destroy' do
    it 'destroys a review' do
      @review = Review.first
      delete "/admin/reviews/#{@review.id}"
      expect(response.status).to eq 204
    end
  end

end
