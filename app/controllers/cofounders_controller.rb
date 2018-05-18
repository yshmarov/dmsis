class CofoundersController < ApplicationController
  before_action :set_cofounder, only: [:show, :destroy]

  def new
    @cofounder = Cofounder.new
  end

  def create
    @cofounder = Cofounder.new(cofounder_params)
    @cofounder.user_id = current_user.id
    if @cofounder.save
      redirect_to idea_path(@cofounder.idea), notice: 'Cofounder was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @cofounder.destroy
      redirect_to idea_path(@cofounder.idea), notice: 'Cofounder was successfully destroyed.'
  end

  private
    def set_cofounder
      @cofounder = Cofounder.find(params[:id])
    end

    def cofounder_params
      params.require(:cofounder).permit(:role, :location, :idea_id, :user_id)
    end
end
