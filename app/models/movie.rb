class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :director
  belongs_to :company

  has_many :shows
  has_many :halls, through: :shows

  has_and_belongs_to_many :actors
  mount_uploader :image, CoverUploader

  scope :with_shows, -> { includes(:shows) }

  def upcoming_shows
    shows.upcoming
  end
end
