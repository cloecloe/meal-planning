require 'nokogiri'
require 'open-uri'
class MealsController < ApplicationController
  def index
    @meals = Meal.all
    if params[:search]
      @recipes = Recipe.algolia_search(params[:search])
      policy_scope(Recipe)
      if @recipes.empty?
        @recipes = Recipe.where(displayed: true)
        @recipes = policy_scope(Recipe).order(:created_at)
        flash[:notice] = "Recipe not found"
      end
    else
      @recipes = Recipe.where(displayed: true)
      @recipes = policy_scope(Recipe).order(:created_at)
    end

    policy_scope(Meal)
  end

  def create
    @meal = Meal.new
    @favorite = Favorite.new
    @review = Review.new
    @recipe = Recipe.find(params[:recipe_id])
    @favorited = Favorite.where(user: current_user, recipe_id: params[:recipe_id]).empty? ? false : true
    @reviews = @recipe.reviews

    @new_meal = Meal.new(meal_params)
    @new_meal.recipe = @recipe
    @new_meal.calendar_id = current_user.calendar_id

    authorize(@meal)

    if @new_meal.save
      flash[:notice] = "Recipe added to your calendar!"
    else
      flash[:notice] = "Something went wrong."
    end
      redirect_to recipe_path(@recipe)
  end

  def destroy
    if params[:meal_ids]
      @meal = Meal.destroy(params[:meal_ids])
    else
      @meal = Meal.find(params[:id])
      @meal.destroy
    end
    authorize(@meal)
    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:tagname, :date)
  end
end
