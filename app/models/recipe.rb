class Recipe < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_one_attached :photo
  validates :title, presence: true, uniqueness: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  validates :serving, presence: true
  validates :preptime, presence: true
  validates :difficulty, presence: true
end
