class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(displayed: true)
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
