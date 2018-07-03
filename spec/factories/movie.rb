FactoryBot.define do
  factory :movie do
    title 'Some Horror Movie'
    description 'Zombies!!!!!!'
    rating 5
    adult_rating 'PG-13'
    movie_length 320
    release_date Time.new
    genre
    director
    company
  end
end
