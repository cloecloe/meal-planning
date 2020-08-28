require 'nokogiri'
require 'open-uri'
class MealsController < ApplicationController
  def index
    @meals = Meal.all
    @array = []
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @meal = Meal.new


  end



  # def create
  #   @recipe = Recipe.find(params[:recipe_id])
  #   @favorite = Favorite.new

  #   if params[:favorite][:favorited] == "true"
  #     @favorite_current = Favorite.where(user_id: current_user, recipe_id: params[:recipe_id])
  #     @favorite_current.first.destroy
  #   else
  #     Favorite.create(user: current_user, recipe_id: params[:recipe_id])
  #   end
  #   redirect_to recipe_path(@recipe)
  # end




  def destroy
    Meal.destroy(params[:meal_ids])
  end

  private

  def meal_params
    params.require(:meal).permit(:tagname, :date)
  end
end
