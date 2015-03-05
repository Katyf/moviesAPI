# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Movie.destroy_all

Movie.create!(title: "The Avengers",
        total_gross: 623279547,
        release_date: "04-05-2012",
        MPAA_rating: "PG-13",
        description: "Nick Fury is director of S.H.I.E.L.D, an international peace keeping agency. The agency is a who's who of Marvel Super Heroes, with Iron Man, The Incredible Hulk, Thor, Captain America, Hawkeye and Black Widow. When global security is threatened by Loki and his cohorts, Nick Fury and his team will need all their powers to save the world from disaster.")

Movie.create!(title: "X-Men",
        total_gross: 30459898,
        release_date: "04-05-2010",
        MPAA_rating: "PG-13",
        description: "Good super people fight bad super people.")

Movie.create!(title: "X-Men 2",
        total_gross: 30459898,
        release_date: "04-05-2011",
        MPAA_rating: "PG-13",
        description: "More good super people fight bad regular people.")

Movie.last.reviews << Review.create!(author: 'Steven', body: 'It was good', rating: 4)
Movie.last.reviews << Review.create!(author: 'Stephen', body: 'It was ok', rating: 3)

