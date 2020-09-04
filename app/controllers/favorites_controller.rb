class FavoritesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @favorites = Favorite.includes(:recipe).where(user: current_user)
    policy_scope(Favorite)
    @other_recipe = Recipe.all.sample
    @second_recipe = Recipe.select { |recipe| recipe.id != @other_recipe.id }.sample
    @third_recipe = Recipe.select { |recipe| recipe.id != @second_recipe.id && recipe.id != @other_recipe.id }.sample
    if params[:search].present?
      @favorites = Favorite.where(user: current_user).algolia_search(params[:search])
      # PG SEARCH VERSION: @favorites = Favorite.search_by_recipe_title_and_ingredients(params[:search])
      policy_scope(Favorite)
      if @favorites.empty?
        @favorites = policy_scope(Favorite).where(user: current_user)
        flash[:notice] = "Favorite not found"
      end
    else
      @favorites = policy_scope(Favorite).where(user: current_user)
    end
    # @favorites = Favorite.includes(:recipe).where(user: current_user)
    # policy_scope(Favorite)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = Favorite.new

    authorize(@favorite)

    if params[:favorite][:favorited] == "true"
      @favorite_current = Favorite.where(user_id: current_user, recipe_id: params[:recipe_id])
      @favorite_current.first.destroy
    else
      Favorite.create(user: current_user, recipe_id: params[:recipe_id])
    end
    redirect_to recipe_path(@recipe)
  end
end
