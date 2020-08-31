class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.includes(:recipe).where(user: current_user)
    policy_scope(Favorite)
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
