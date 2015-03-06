class Movie < ActiveRecord::Base
  MPAA_RATING = %w{G PG PG-13 R NC-17}

  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :MPAA_rating, inclusion: {in: MPAA_RATING, message: "is Invalid"}
end
