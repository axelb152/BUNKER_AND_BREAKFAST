class BunkersController < ApplicationController
  def index
    @bunkers = policy_scope(Bunker)
  end

  def new
    @bunker = Bunker.new
    authorize @bunker
  end

  def show
    @bunker = Bunker.find(params[:id])
    authorize @bunker
  end

  def create
    @bunker = Bunker.new(bunker_params)
    @bunker.user = current_user
    authorize @bunker
  end

  def edit
    authorize @bunker
  end

  def update
    authorize @bunker
  end

  def destroy
    authorize @bunker
  end

  private

  def bunker_params
    params.require(:bunker).permit(:name, :description, :price, :location, :max_capacity)
  end
end
