class HomeController < ApplicationController
  def index
    if current_user
      redirect_to fresh_ideas_path
    end
  end
end
