class Director < ApplicationRecord
  validates :name, presence: true, length: { in: 3..200 }
  validates :description, length: { maximum: 2000 }

  has_many :movies
end
