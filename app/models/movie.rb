class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :director
  belongs_to :company

  has_and_belongs_to_many :actors
end
