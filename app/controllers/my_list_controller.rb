class MyListController < ApplicationController
  before_action :check_for_login, :only => [:index]

  def index
    @list = @current_user.favorites
  end

  private
  def get_poster_by_title(title)
    response = HTTParty.get("http://www.omdbapi.com/?apikey=#{Rails.application.secrets.omdbKey}&t=#{title}")
    response.parsed_response['Poster']
  end
end
