class MoviesController < ApplicationController
  
  def index
    @movies = get_data_by_title(params[:title])
    
    # @movie.image = hash.get_poster_by_title("Guardians of the Galaxy Vol. 2")

  end

  def show
    @movie = get_movie_by_title(params[:id])
    if @current_user.present?
      @liked = @current_user.favorites.exists?(:movie_title => @movie["Title"]) 
    end
    @comment = Comment.new
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :rate, :image)
  end

  private

  def get_data_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&s=#{title}")
    response.parsed_response['Search']
  end

  def get_movie_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&t=#{title}")
    response.parsed_response
  end
end
