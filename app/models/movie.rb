class Movie < ApplicationRecord
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :actors
  has_many :tracks

  include PgSearch::Model
  pg_search_scope :pg_search, against: [:title, :director, :year]

end
