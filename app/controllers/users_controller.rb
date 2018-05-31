class UsersController < ApplicationController
  before_action :set_idea, only: [:show]

  def show
    #@ideas = Idea.where(user_id: @user.id)
    @ideas = @user.ideas
  end
  
  def index
    if current_user.has_role?(:admin)
      @users = User.order("created_at DESC")
    else
      redirect_to root_path, alert: 'Page does not exist.'
    end
  end

  private
    def set_idea
      @user = User.find(params[:id])
    end
end
