class Show < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  has_many :reservations
  has_many :orders, through: :reservations

  scope :upcoming, lambda {
    where('show_time > ? and show_time < ?', Time.now, Time.now + 3.days)
      .order('hall_id ASC, show_time ASC')
  }
end
