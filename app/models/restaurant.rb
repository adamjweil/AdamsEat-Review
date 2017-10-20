class Restaurant < ApplicationRecord
  validates :name, :cuisine, :address, :city, :state, :zip, presence: true
  belongs_to :user
  has_many :reviews

  def average_review
    reviews.average(:numerical_review)
  end
end
