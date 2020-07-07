# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

years = (1950..2020).to_a

Movie.destroy_all
Genre.destroy_all

5.times do
  Genre.create(name: Faker::Music.genre )
end

genres = []
Genre.all.map { |genre| genres << genre }

images = ['https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
          'https://images.unsplash.com/photo-1590341328520-63256eb32bc3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80',
          'https://images.unsplash.com/photo-1568833450751-fba3c6b2d129?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80',
          'https://images.unsplash.com/photo-1542623024-a797a755b8d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=2551&q=80',
          'https://images.unsplash.com/photo-1521714161819-15534968fc5f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80']


20.times do
  Movie.create(title: Faker::Movie.quote,
               year: years.sample,
               director: Faker::Movies::HarryPotter.house,
               is_good: [true, false].sample,
               image: images.sample  )
end
