class FavoritesController < ApplicationController
  def index
  end

  def create
    if params[:favorite][:favorited] == "true"
      @favorite = Favorite.where(user_id: current_user, recipe_id: params[:recipe_id])
      @favorite.first.destroy
    else
      Favorite.create(user: current_user, recipe_id: params[:recipe_id])
    end
  end

    # @recipe = Recipe.find(params[:recipe_id])
    # @favorites = @recipe.favorites
    # @favorite = Favorite.new
    # @favorite.recipe = @recipe
    # @favorite.user = current_user
    # @favorite.save

# def create
#     @equipment = Equipment.find(params[:equipment_id])
#     @bookings = @equipment.bookings
#     @booking = Booking.new(booking_params)

#     @booking.equipment = @equipment
#     @booking.user = current_user
#     authorize(@booking)
#     unless @bookings.find{|book| book.equipment_id = params[:equipment_id] && book.user_id == current_user.id && book.status == "pending"}
#       if @booking.save
#         redirect_to equipment_path(@equipment)
#         flash[:notice] = "Request made to #{User.find(@equipment.user_id).first_name}! Go to Dashboard to see status"
#       else
#         flash.now[:notice] = "Request could not be made. Please try again"
#         render 'equipments/show'
#       end
#     else
#       flash.now[:notice] = "#{@equipment.name.capitalize} already booked at this date."
#       render 'equipments/show'
#     end
#   end



end
