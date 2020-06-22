require 'httparty'

class ImdbService


    def get_title_by_title(title)
        response = HTTParty.get("http://www.omdbapi.com/?t=#{title}&apikey=3e9bc519")
        puts response.parsed_response['Title']
    end
  
    def get_year_by_title(title)
      response = HTTParty.get("http://www.omdbapi.com/?t=#{title}&apikey=3e9bc519")
      puts response.parsed_response['Year']
    end
  
    def get_rate_by_title(title)
      response = HTTParty.get("http://www.omdbapi.com/?t=#{title}&apikey=3e9bc519")
      puts response.parsed_response['imdbRating']
    end
  
    def get_poster_by_title(title)
      response = HTTParty.get("http://www.omdbapi.com/?t=#{title}&apikey=3e9bc519")
      puts response.parsed_response['Poster']
    end
end