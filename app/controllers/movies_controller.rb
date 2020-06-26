class MoviesController < ApplicationController
  
  # Finding a move by title name which is a primary key in this API
  def index
    @movies = get_data_by_title(params[:title])
  end


  def show
    @movie = get_movie_by_title(params[:id])
    if @current_user.present?
      # Check for favorite situation
      @liked = @current_user.favorites.exists?(:movie_title => @movie["Title"]) 
    end
    # Adding Comment
    @comment = Comment.new
    # Reading all of the comments
    @comments = Comment.all.where(:title => params["id"])
    @users = User.all
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :rate, :image)
  end

  private

  # JSON Parsing
  def get_data_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&s=#{title}")
    response.parsed_response['Search']
  end

  def get_movie_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&t=#{title}")
    response.parsed_response
  end
end
