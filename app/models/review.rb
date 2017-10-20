class Review < ApplicationRecord
  validates :numerical_review, presence: true
  belongs_to :user
  belongs_to :restaurant
end
