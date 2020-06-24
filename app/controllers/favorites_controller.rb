class FavoritesController < ApplicationController
  before_action :check_for_login

  def add
    favorite = Favorite.new :title => params["movie_title"]
    @current_user.favorites << favorite
    redirect_back :fallback_location => movies_path
  end

  def remove
    
    fav = Favorite.find_by(:title => params["movie_title"])
    @current_user.favorites.find(fav.id).destroy
    redirect_back :fallback_location => movies_path
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
