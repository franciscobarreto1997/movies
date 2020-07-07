class Addisgoodtomovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :is_good, :boolean
  end
end
