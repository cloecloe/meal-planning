class Recipe < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_one_attached :photo

  include AlgoliaSearch

  algoliasearch do
    attributes :title, :ingredients
    add_attribute :user_ids
    # searchableAttributes ['title', 'ingredients', 'user_first_name', 'user_email']
  end
end
