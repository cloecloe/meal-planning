require 'nokogiri'
require 'open-uri'
class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end
  
  def create
  end

  def destroy
    Meal.destroy(params[:meal_ids])
  end
end
