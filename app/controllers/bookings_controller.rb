class BookingsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @bunker_id = booking_params[:bunker_id]
    @bunker = Bunker.find(@bunker_id)
    @booking.user_id = current_user.id
    @booking.status = "Pending"
    @booking.total_price = @bunker.price * (@booking.end_date - @booking.start_date)
    @booking.save!
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:bunker_id, :start_date, :end_date, :number_of_guests)
  end
end
