class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :director
  belongs_to :company

  has_many :shows
  has_many :halls, through: :shows

  has_and_belongs_to_many :actors
  mount_uploader :image, CoverUploader

  scope :with_shows, -> { includes(:shows) }
  scope :extended_movies, -> { includes(:company, :director, :genre) }

  def halls_for_upcoming_shows
    halls.distinct.where('shows.show_time > ? and shows.show_time < ?', Time.now, Time.now + 3.days)
      .order('title ASC')
  end
end
