class Review < ActiveRecord::Base
  belongs_to :movie
  validates :body, presence: true
end
