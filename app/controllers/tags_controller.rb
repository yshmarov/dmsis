class TagsController < ApplicationController
  before_action :set_tag, only: [:show]
  def show
    @ideas = @tag.ideas
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:idea).permit(:name)
    end
end
