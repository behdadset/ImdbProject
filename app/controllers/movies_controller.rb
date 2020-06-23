class MoviesController < ApplicationController
  def index
    @movies = get_data_by_title(params[:title])
    
    # @movie.image = hash.get_poster_by_title("Guardians of the Galaxy Vol. 2")

  end

  def show
    @movie = get_movie_by_title(params[:id])
   
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :rate, :image)
  end

  private

  def get_year_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&s=#{title}")
    response.parsed_response['Year']
  end

  def get_rate_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&s=#{title}")
    response.parsed_response['imdbRating']
  end

  def get_poster_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&s=#{title}")
    response.parsed_response['Poster']
  end

  def get_title_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&s=#{title}")
    response.parsed_response['Title']
  end

  def get_data_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&s=#{title}")
    response.parsed_response['Search']
  end

  def get_movie_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&t=#{title}")
    response.parsed_response
  end
end
