class BunkersController < ApplicationController
  before_action :set_bunker, only: %i[show edit update destroy]
  def index
    if params[:query].present?
      @bunkers = policy_scope(Bunker).search_by_category(params[:query])
    else
      @bunkers = policy_scope(Bunker)
    end
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
    if @bunker.save
      redirect_to bunker_path(@bunker)
    else
      render :new
    end
    authorize @bunker
  end

  def edit
    authorize @bunker
  end

  def update
    @bunker.update(bunker_params)
    authorize @bunker
    if @bunker.save
      redirect_to bunker_path(@bunker)
    else
      render :edit
    end
  end

  def destroy
    @bunker.destroy
    redirect_to bunkers_manage_path
    authorize @bunker
  end

  def manage
    @mybunkers = policy_scope(Bunker)
    authorize @mybunkers
    @mybunkers = Bunker.where(user_id: current_user.id)
    @totalcash = total_cash_accepted(@mybunkers)
  end

  private

  def total_cash_accepted(bunkers)
    sum = 0
    bunkers.each do |b|
      b.bookings.each do |bo|
        sum += bo.total_price
      end
    end
    return sum
  end

  def set_bunker
    @bunker = Bunker.find(params[:id])
  end

  def bunker_params
    params.require(:bunker).permit(:name, :description, :price, :location, :max_capacity, :bed, :bedroom, :bathroom,
                                   :category, :cover_photo, photos: [])
  end
end
