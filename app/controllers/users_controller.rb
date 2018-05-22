class UsersController < ApplicationController
  def index
    if current_user.has_role?(:admin)
      @users = User.order("created_at DESC")
    else
      redirect_to root_path, alert: 'Page does not exist.'
    end
  end
end
