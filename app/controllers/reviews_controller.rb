class ReviewsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @favorite = Favorite.new
    @reviews = @recipe.reviews
    @review.user = current_user
    @review.recipe_id = @recipe.id

    authorize(@review)

    if @review.save
      redirect_to recipe_path(@recipe)
    else
      render "recipes/show"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.find(params[:id])
    authorize(@review)
    @review.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
