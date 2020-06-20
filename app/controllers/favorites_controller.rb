class FavoritesController < ApplicationController
  before_action :check_for_login

  def new
    @favorite = Favorite.new
  end

  def create
    
    favorite = Favorite.create favorite_params
    @current_user.favorites << favorite
    redirect_to root_path
  end

  private
  def favorite_params
    params.require(:favorite).permit(:title)
  end
end
