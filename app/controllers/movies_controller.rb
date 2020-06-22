class MoviesController < ApplicationController
  def index
    @movies = get_poster_by_title(params[:title])
    hash = ImdbService.new
    # @movie.image = hash.get_poster_by_title("Guardians of the Galaxy Vol. 2")

  end

  def show
    @movie = Movie.get_image_by_title("Guardians of the Galaxy Vol. 2")
    @movie.poster = hash.get_image_by_title(@movie.title)
    @review = Review.new
    @reviews = @movie.reviews
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :rate, :image)
  end

  private

  def get_year_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?s=#{title}&apikey=3e9bc519")
    response.parsed_response['Year']
  end

  def get_rate_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?s=#{title}&apikey=3e9bc519")
    response.parsed_response['imdbRating']
  end

  def get_poster_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?s=#{title}&apikey=3e9bc519")
    response.parsed_response['Search']
  end
end
