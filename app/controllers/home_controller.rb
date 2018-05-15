class HomeController < ApplicationController
  def index
    if current_user
      redirect_to ideas_path
    end
  end
end
