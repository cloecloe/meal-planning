class CalendarsController < ApplicationController
  def new

  end
  
  def share
    @user = User.find_by(email: params[:email])
    if @user
      @user.calendar_id = params[:id]
      @user.save
      redirect_to meals_path
      flash[:notice] = "Share successful"
    else
      redirect_to meals_path
      flash[:notice] = "User not found"
    end
  end
end
