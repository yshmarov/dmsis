class UsersController < ApplicationController
  before_action :set_idea, only: [:show]

  def show
    #@ideas = Idea.where(user_id: @user.id)
    @ideas = @user.ideas.order('created_at DESC')
    #@ideas =  @user.ideas.order('published_at DESC')
    @comments = @user.comments
  end
  
  def index
    @users = User.order("created_at DESC")
    if current_user.has_role?(:admin)
      @users = User.order("created_at DESC")
    else
      redirect_to user_path(current_user)
      #redirect_to root_path, alert: 'Page does not exist.'
    end
  end

  def people
    @users = User.order("created_at DESC")
  end

  private
    def set_idea
      @user = User.find(params[:id])
    end
end
