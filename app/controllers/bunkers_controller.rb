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

    @booking = Booking.new
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

  def bunker_params
    params.require(:bunker).permit(:name, :description, :price, :location, :max_capacity)
  end
end
