class Actor < ApplicationRecord
  validates :name, presence: true, length: { in: 3..200 }
  validates :description, length: { maximum: 2000 }
end
