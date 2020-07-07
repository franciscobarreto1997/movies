class Movie < ApplicationRecord
  has_and_belongs_to_many :genres

  include PgSearch::Model
  pg_search_scope :pg_search, against: [:title]

end
