class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end
  
  def create
  end

  def destroy
  end
end
