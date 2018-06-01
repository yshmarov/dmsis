class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:destroy]

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.user_id = current_user.id
    if @attachment.save
      redirect_to idea_path(@attachment.idea), notice: 'Attachment was successfully created.'
    else
      redirect_to idea_path(@attachment.idea), alert: 'Not all fields filled. Try again!'
    end
  end

  def destroy
    @attachment.destroy
      redirect_to idea_path(@attachment.idea), notice: 'Attachment was successfully destroyed.'
  end

  private
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    def attachment_params
      params.require(:attachment).permit(:title, :url, :status, :idea_id)
    end
end
