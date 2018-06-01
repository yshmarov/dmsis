class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to idea_path(@comment.idea), notice: 'Comment was successfully created.'
    else
      redirect_to idea_path(@comment.idea), alert: 'No text in comment. Try again!'
      #render :new
    end
  end

  def destroy
    @comment.destroy
      redirect_to idea_path(@comment.idea), notice: 'Comment was successfully destroyed.'
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :idea_id, :user_id)
    end
end
