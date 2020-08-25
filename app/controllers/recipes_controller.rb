class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(displayed: true)
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
