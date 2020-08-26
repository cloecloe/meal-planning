class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(displayed: true)
    filter(params[:format])
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
    when "individual"
      @recipes = Recipe.where(serving: "Serves 1", displayed: true)
    when "couple"
      @recipes = Recipe.where(serving: "Serves 2", displayed: true)
    when "family"
      isfamily = ""
      @recipes = Recipe.where.not(serving: ["Serves 2","Serves 1"], displayed: false)
    else ""
      @recipes = Recipe.where(displayed: true)
    end
    render :index
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :photo, :preptime, :serving, :difficulty, :displayed)
  end

end
