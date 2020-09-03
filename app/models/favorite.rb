class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates_uniqueness_of :recipe_id, scope: :user_id

  #*************************************************
  #PG SEARCH VERSION:
  # include PgSearch::Model
  # pg_search_scope :search_by_recipe_title_and_ingredients,
    # associated_against: {
    #   recipe: [ :title, :ingredients ]
    # },
    # using: {
    #   tsearch: { prefix: true }
    # }
  #*************************************************

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
