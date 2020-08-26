class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(displayed: true)
    filter(params[:format])
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

  def filter(tag)
    case tag
    when "easy"
      @recipes = Recipe.where(difficulty: "Easy", displayed: true)
    when "effort"
      @recipes = Recipe.where(difficulty: "More effort", displayed: true)
    when "challenge"
      @recipes = Recipe.where(difficulty: "A challenge", displayed: true)
    when "quick"
      @recipes = Recipe.where(preptime: (10..30), displayed: true)
    when "short"
      @recipes = Recipe.where(preptime: (31..59), displayed: true)
    when "long"
      @recipes = Recipe.where(preptime: (1..5), displayed: true)
    when "indivudual"
      @recipes = Recipe.where(serving: 0 || 1, displayed: true)
    when "couple"
      @recipes = Recipe.where(serving: 2, displayed: true)
    when "family"
      @recipes = Recipe.where(serving: (3..100), displayed: true)
    else ""
      @recipes = Recipe.where(displayed: true)
    end
    render :index
  end
  
end
