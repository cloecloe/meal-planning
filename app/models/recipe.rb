class Recipe < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_one_attached :photo

  include AlgoliaSearch

  algoliasearch do
  add_attribute :extra_attr
  searchableAttributes ['title', 'ingredients']
  end

  def extra_attr 
    self.meal.tagname
  end
end
