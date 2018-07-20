class Reservation < ApplicationRecord
  belongs_to :show
  belongs_to :order

  before_validation :duplicated_reservations

  private

  def duplicated_reservations
    r = Reservation.where(show: show, seat: seat, row: row).first
    throw :abort if r
  end
end
