class Addgenrereftomovies < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :genre, foreign_key: true
  end
end
