class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [ :index, :privacy_policy, :terms_of_service ]

  def index
    if current_user
      redirect_to fresh_ideas_path
    end
  end

  def privacy_policy
  end

  def terms_of_service
  end
end
