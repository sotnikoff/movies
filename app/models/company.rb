class Company < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, length: { maximum: 2000 }

  has_many :movies
end
