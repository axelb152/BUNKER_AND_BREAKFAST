class BunkersController < ApplicationController
  before_action :set_bunker, only: %i[show edit update destroy]
  def index
    @bunkers = policy_scope(Bunker)
  end

  def new
    @bunker = Bunker.new
    authorize @bunker
  end

  def show
    authorize @bunker

    @booking = Booking.new
  end

  def create
    @bunker = Bunker.new(bunker_params)
    @bunker.user = current_user
    @bunker.save
    redirect_to bunker_path(@bunker)

    authorize @bunker
  end

  def edit
    authorize @bunker
  end

  def update
    @bunker.update(bunker_params)
    if @bunker.save
      redirect_to bunker_path(@bunker)
    else
      render :new
    end
    authorize @bunker
  end

  def destroy
    authorize @bunker
  end

  def manage
    @mybunkers = policy_scope(Bunker)
    authorize @mybunkers
    @mybunkers = Bunker.where(user_id: current_user.id)

  end

  private

  def set_bunker
    @bunker = Bunker.find(params[:id])
  end

  def bunker_params
    params.require(:bunker).permit(:name, :description, :price, :location, :max_capacity, :bed, :bedroom, :bathroom, :category )
  end
end
