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

Movie.create!(title: "Frozen",
        total_gross: 400736600,
        release_date: "27-12-2013",
        MPAA_rating: "PG",
        description: "When the newly crowned Queen Elsa accidentally uses her power to turn things into ice to curse her home in infinite winter, her sister, Anna, teams up with a mountain man, his playful reindeer, and a snowman to change the weather condition.")

Movie.create!(title: "The Wolf of Wall Street",
        total_gross: 116866727,
        release_date: "25-12-2013",
        MPAA_rating: "R",
        description: "Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.")
Movie.create!(title: "Gravity",
        total_gross: 274084951,
        release_date: "04-10-2013",
        MPAA_rating: "PG-13",
        description: "A medical engineer and an astronaut work together to survive after a catastrophe destroys their shuttle and leaves them adrift in orbit. ")
Movie.create!(title: "The Lego Movie",
        total_gross: 274084951,
        release_date: "07-02-2014",
        MPAA_rating: "PG",
        description: "An ordinary Lego construction worker, thought to be the prophesied 'Special', is recruited to join a quest to stop an evil tyrant from gluing the Lego universe into eternal stasis.")
Movie.create!(title: "The Hunger Games",
        total_gross: 274084951,
        release_date: "23-03-2012",
        MPAA_rating: "PG-13",
        description: "Katniss Everdeen voluntarily takes her younger sister's place in the Hunger Games, a televised fight to the death in which two teenagers from each of the twelve Districts of Panem are chosen at random to compete.")

Movie.last.reviews << Review.create!(author: 'Steven', body: 'It was good', rating: 4)
Movie.last.reviews << Review.create!(author: 'Stephen', body: 'It was ok', rating: 3)

