class Reservation < ApplicationRecord
  belongs_to :show
  belongs_to :order
end
