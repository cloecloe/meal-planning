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
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.ingredients = params[:recipe][:ingredients].split("\r\n")
    @recipe.instructions = params[:recipe][:instructions].split("\r\n")

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :photo, :preptime, :serving, :difficulty, :displayed)
  end
end
