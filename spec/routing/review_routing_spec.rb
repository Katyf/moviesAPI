require 'rails_helper'

RSpec.describe "routes for review" do

  it 'routes GET /movies/id/reviews to the review controller' do
    movie1 = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review)
    expect(get("/movies/#{movie1.id}/reviews")).to route_to('reviews#index', movie_id: movie1.id.to_s)
  end

  it 'routes GET /movies/id/reviews to the review controller' do
    movie1 = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review)
    expect(get("/admin/reviews/")).to route_to('reviews#index')
  end

  it 'routes POST /movies/id/reviews to the review controller' do
    movie1 = FactoryGirl.create(:movie)
    expect(post("/movies/#{movie1.id}/reviews")).to route_to('reviews#create', movie_id: movie1.id.to_s)
  end

 it 'routes PATCH /admin/reviews/:id to the review controller' do
    movie1 = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review)
    expect(patch("/admin/reviews/#{review.id}")).to route_to('reviews#update', id: review.id.to_s)
  end

 it 'routes DELETE /admin/reviews/:id to the review controller' do
    movie1 = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review)
    expect(delete("/admin/reviews/#{review.id}")).to route_to('reviews#destroy', id: review.id.to_s)
  end

end
