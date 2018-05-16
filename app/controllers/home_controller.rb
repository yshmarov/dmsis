class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :index ]

  def index
    if current_user
      redirect_to fresh_ideas_path
    end
  end
end
