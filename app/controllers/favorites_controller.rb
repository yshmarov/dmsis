class FavoritesController < ApplicationController
#  respond_to :js
#  
#  def favorite
#    @user = current_user
#    @idea = Idea.find(params[:idea_id])
#    @user.favorite!(@idea)
#  end
#  
#  def unfavorite
#    @user = current_user
#    @favorite = @user.favorites.find_by_idea_id(params[:idea_id])
#    @idea = Idea.find(params[:idea_id])
#    @favorite.destroy!
#  end
#  #before_action :authenticate_user! 
#  before_action :find_idea!
#
#  def create
#    current_user.favorite(@idea)
#
#    render 'ideas/show'
#  end
#
#  def destroy
#    current_user.unfavorite(@idea)
#
#    render 'ideas/show'
#  end
#
#  private
#
#  def find_idea!
#    #@idea = Idea.find_by_slug!(params[:slug])
#    @idea = Idea.friendly.find(params[:id])
#  end
end