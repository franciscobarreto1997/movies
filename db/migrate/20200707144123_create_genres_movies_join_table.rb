class CreateGenresMoviesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :genres_movies, id: false do |t|
      t.bigint :genre_id
      t.bigint :movie_id
    end

    add_index :genres_movies, :genre_id
    add_index :genres_movies, :movie_id
  end
end
