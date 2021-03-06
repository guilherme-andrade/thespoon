class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true

  def rating
    reviews.map(&:rating).sum / reviews.count
  end
end
