class Actor < ApplicationRecord
  has_and_belongs_to_many :movies
  include PgSearch::Model
  pg_search_scope :pg_search, against: [:name, :age]
end
