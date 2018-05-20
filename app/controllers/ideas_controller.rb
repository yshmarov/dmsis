class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    redirect_to unrated_ideas_path
  end

  def unrated
    @ideas = Idea.where.not(id: current_user.find_voted_items.map(&:id)).limit(1)
  end

  def mine
    @ideas = Idea.where(user: current_user)
  end

  def fresh
    @ideas = Idea.order("created_at DESC").all
  end

  def top
    @ideas = Idea.order(:cached_weighted_score => :desc)
    render 'top'
  end

  def upvote
    @idea.upvote_by current_user
    redirect_back fallback_location: root_path, notice: 'upvoted'
    #redirect_to fresh_ideas_path
    #redirect_to idea_path(@idea)
  end

  def downvote
    @idea.downvote_by current_user
    redirect_back fallback_location: root_path, notice: 'downvoted'
    #redirect_to fresh_ideas_path
    #redirect_to idea_path(@idea)
  end

  def show
    @comments = @idea.comments
    @comment = Comment.new
    @cofounder = Cofounder.new
    @cofounders = @idea.cofounders
    @current_user_is_a_cofounder = Cofounder.where(idea_id: @idea.id).where(user_id: current_user.id).present?
  end

  def new
    @idea = Idea.new
  end

  def edit
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      redirect_to @idea, notice: 'Idea was successfully created.'
    else
      render :new
    end
  end

  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Idea was successfully updated.'
    else
      render :edit
      format.html { render :edit }
    end
  end

  def destroy
    @idea.destroy
      redirect_to fresh_ideas_path, notice: 'Idea was successfully destroyed.'
  end

  private
    def set_idea
      #@idea = Idea.find(params[:id])
      @idea = Idea.friendly.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:name, :description, :user_id,
        idea_tags_attributes: [:id, :_destroy, :tag_id, tag_attributes: [:id, :_destroy, :name]]      
      )
    end
end
