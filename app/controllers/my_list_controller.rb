class MyListController < ApplicationController
  before_action :check_for_login, :only => [:index]

  def index
    @list = @current_user.favorites
  end

end
