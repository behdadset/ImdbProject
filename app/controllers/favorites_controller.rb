class FavoritesController < ApplicationController
  before_action :check_for_login

  def add
    favorite = Favorite.new :movie_title => params["movie_title"]
    @current_user.favorites << favorite
    redirect_back :fallback_location => movies_path
  end

  def remove
    fav = Favorite.find_by(:movie_title => params["movie_title"])
    @current_user.favorites.destroy fav.id
    redirect_back :fallback_location => movies_path
  end


  def create
    
    favorite = Favorite.create favorite_params
    @current_user.favorites << favorite
    redirect_to root_path
  end

  private
  def favorite_params
    params.require(:favorite).permit(:movie_title, :user_id)
  end
end
