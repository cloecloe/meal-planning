class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  include AlgoliaSearch
  
  algoliasearch do
  add_attribute :recipe_title, :recipe_ingredients
  # searchableAttributes ['recipe_title', 'recipe_ingredients']
  end

  def recipe_title
    self.recipe.title
  end

  def recipe_ingredients
    self.recipe.ingredients
  end
end
