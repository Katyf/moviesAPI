FactoryGirl.define do
  factory :review do
    author Faker::Name.name
    body Faker::Lorem.paragraphs(1)
    rating Faker::Number.digit
    movie
  end
end
