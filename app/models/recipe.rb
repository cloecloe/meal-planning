class Recipe < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_one_attached :photo
end
