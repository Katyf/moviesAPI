FactoryGirl.define do
  factory :movie do
    title Faker::Lorem.sentence
    total_gross Faker::Number.number(9)
    release_date Faker::Date.between(5.years.ago, Date.today)
    MPAA_rating Faker::Lorem.characters(2)
    description Faker::Lorem.paragraphs(1)
  end
end
