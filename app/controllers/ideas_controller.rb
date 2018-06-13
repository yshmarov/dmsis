class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :publish, :unpublish]

  def publish
  	@idea.update_attribute(:published_at, Time.now)
  	redirect_to @idea, notice: "Published!"
  end

  def unpublish
  	@idea.update_attribute(:published_at, nil)
  	redirect_to @idea, notice: "UnPublished!"
  end

  def index
    redirect_to top_ideas_path
  end

  def trending
    #has the most association quantity in the last X days
    @ideas = Idea.all
    render 'ideas/index'
  end

  def cofounding
    @ideas = Idea.joins(:cofounders).where(cofounders: {user_id: current_user.id})
    render 'ideas/index'
  end

  def upvoted
    @ideas = Idea.where(id: current_user.find_up_voted_items.map(&:id))
    render 'ideas/index'
  end

  def unvoted
    @ideas = Idea.where.not(id: current_user.find_voted_items.map(&:id))
    render 'ideas/index'
  end

  def random
    @ideas = Idea.limit(1).order("RANDOM()")
    render 'ideas/index'
  end

  def my
    @ideas = Idea.where(user: current_user)
    render 'ideas/index'
  end

  def fresh
    @ideas = Idea.order("created_at DESC").all
    render 'ideas/index'
  end

  def top
    @ideas = Idea.order(:cached_weighted_score => :desc)
    render 'ideas/index'
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
    @comment = Comment.new
    @comments = @idea.comments
    @attachment = Attachment.new
    @attachments = @idea.attachments
    @cofounder = Cofounder.new
    @cofounders = @idea.cofounders
    @current_user_is_a_cofounder = Cofounder.where(idea_id: @idea.id).where(user_id: current_user.id).present?
  end

  def tag_cloud
      Idea.find(:first).pins.tag_counts_on(:tags)
      @tags = Idea.tag_counts_on(:tags)
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
      redirect_to @idea, notice: 'Idea draft was created. Review and publish!'
    else
      render :new
    end
  end

  def update
    #if @idea.created_at > Time.now - 24.hours
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Idea was successfully updated.'
    else
      render :edit
      format.html { render :edit }
    end
    #else
    #  render :edit, notice: 'Too old to update.'
    #end
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
      params.require(:idea).permit(:name, :description, :published_at, :user_id,
        idea_tags_attributes: [:id, :_destroy, :tag_id, tag_attributes: [:id, :_destroy, :name]]      
      )
    end
end
