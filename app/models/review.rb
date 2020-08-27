class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :description, presence: true
  validates :rating, presence: true
end
