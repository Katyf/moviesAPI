require 'rails_helper'

RSpec.describe "routes for review" do

  it 'routes GET /movies/id/reviews to the review controller' do
    movie1 = FactoryGirl.create(:movie)
    comment = FactoryGirl.create(:review)
    expect(get("/movies/#{movie1.id}/reviews")).to route_to('reviews#index')
  end

  it 'routes POST /movies/id/reviews to the review controller' do
    movie1 = FactoryGirl.create(:movie)
    expect(post("/movies/#{movie1.id}/reviews")).to route_to('reviews#create')
  end




end
