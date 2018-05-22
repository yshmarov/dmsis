class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :destroy]
  
  def index
    @tags = Tag.order("name ASC")
  end

  def show
    @ideas = @tag.ideas
  end

  def destroy
    if current_user.has_role?(:admin)
      @tag.destroy
        redirect_to tags_path, notice: 'Tag was successfully destroyed.'
    else
      redirect_to root_path, alert: 'You are not authorized to view the page.'
    end
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:idea).permit(:name)
    end
end
