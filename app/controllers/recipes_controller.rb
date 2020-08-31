class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: :show

  def index
    if user_signed_in?
      @favorites = Favorite.where(user_id: current_user.id)
    end
    if params[:search]
      @recipes = Recipe.algolia_search(params[:search])
      policy_scope(Recipe)
      if @recipes.empty?
        @recipes = Recipe.where(displayed: true)
        filter(params[:format])
        @recipes = policy_scope(Recipe).order(:created_at)
        flash[:notice] = "Recipe not found"
      end
    else
      @recipes = Recipe.where(displayed: true)
      filter(params[:format])
      @recipes = policy_scope(Recipe).order(:created_at)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @favorited = Favorite.where(user: current_user, recipe_id: params[:id]).empty? ? false : true
    @favorite = Favorite.new
    @review = Review.new
    @reviews = @recipe.reviews
    @meal = Meal.new
    authorize(@recipe) if current_user
  end

  def new
    @recipe = Recipe.new
    authorize(@recipe)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.ingredients = params[:recipe][:ingredients].split("\r\n")
    @recipe.instructions = params[:recipe][:instructions].split("\r\n")
    @recipe.displayed = params[:recipe][:displayed] == "Yes" ? true : false

    authorize(@recipe)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    authorize(@recipe)
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    @recipe.ingredients = params[:recipe][:ingredients].split("\r\n")
    @recipe.instructions = params[:recipe][:instructions].split("\r\n")

    authorize(@recipe)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    authorize(@recipe)
    redirect_to recipes_path
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
