# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kubrick = Director.create!(name: 'Stanley Kubrick', birth_year: 1928, birth_place: 'Carthage, New York', still_active: false)
hitchcock = Director.create!(name: 'Alfred Hitchcock', birth_year: 1899, birth_place: 'Essex, England', still_active: false)
aster = Director.create!(name: 'Ari Aster', birth_year: 1986, birth_place: 'New York City, New York', still_active: true)
joonho = Director.create!(name: 'Bong Joon Ho', birth_year: 1969, birth_place: 'Daegu, South Korea', still_active: true)

kubrick.movies.create!(name: 'The Shining', release_year: 1980, mpaa_rating: 'R', run_time: 146, rotten_tomatoes_score: 82, oscar_winner: false)
kubrick.movies.create!(name: '2001: A Space Odyssey', release_year: 1968, mpaa_rating: 'G', run_time: 159, rotten_tomatoes_score: 92, oscar_winner: true)
hitchcock.movies.create!(name: 'The Birds', release_year: 1963, mpaa_rating: 'PG-13', run_time: 119, rotten_tomatoes_score: 93, oscar_winner: false)
hitchcock.movies.create!(name: 'Vertigo', release_year: 1958, mpaa_rating: 'PG', run_time: 128, rotten_tomatoes_score: 92, oscar_winner: false)
hitchcock.movies.create!(name: 'Psycho', release_year: 1960, mpaa_rating: 'R', run_time: 109, rotten_tomatoes_score: 96, oscar_winner: false)
aster.movies.create!(name: 'Midsommar', release_year: 2019, mpaa_rating: 'R', run_time: 148, rotten_tomatoes_score: 83, oscar_winner: false)
joonho.movies.create!(name: 'Parasite', release_year: 2019, mpaa_rating: 'R', run_time: 132, rotten_tomatoes_score: 99, oscar_winner: true)
