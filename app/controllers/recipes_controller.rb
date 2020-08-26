class RecipesController < ApplicationController
  def index
    # PARAMS = {"search"=>"test", "button"=>""}
    if params[:search]
      @recipes = Recipe.algolia_search(params[:search])
      # Pundit version: policy_scope(Recipe)
      if @recipes.empty?
        @recipes = Recipe.where(displayed: true)
        # Pundit version: @recipes = policy_scope(Recipe).order(:created_at)
        flash[:notice] = "Recipe not found"
      end
    else
      @recipes = Recipe.where(displayed: true)
      # Pundit version: @recipes = policy_scope(Recipe).order(:created_at)
    end
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
