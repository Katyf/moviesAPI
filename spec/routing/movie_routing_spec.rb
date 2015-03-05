require 'rails_helper'

RSpec.describe "routes for movies" do

  it 'routes GET /movies to the movies controller' do
    movie1 = FactoryGirl.create(:movie)
    movie2 = FactoryGirl.create(:movie)
    movie3 = FactoryGirl.create(:movie)
    expect(get('/movies')).to route_to('movies#index')
  end

  it 'routes GET /movies/id to the movies controller' do
    movie = FactoryGirl.create(:movie)
    expect(get("/movies/#{movie.id}")).to route_to('movies#show', id: movie.id.to_s)
  end

  it 'routes POST /movies to the movies controller' do
    expect(post('/movies')).to route_to('movies#create')
  end

  it 'routes PATCH /movies/:id to the movies controller' do
    movie = FactoryGirl.create(:movie)
    expect(patch("/movies/#{movie.id}")).to route_to('movies#update', id: movie.id.to_s)
  end

end
