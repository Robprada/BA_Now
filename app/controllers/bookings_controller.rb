class BookingsController < ApplicationController
  # def index
  #   @bookings = Booking.all
  # end

  def new
    @experience = Experience.find(params[:id])
    @booking = @experience.bookings.new
  end

  def create
    @experince = Experience.find(params[:id])
    @booking = @experience.bookings.new(booking_params)
    if @booking.save
      redirect_to root_path, notice: 'Booking created succesfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :hour, :tickets)
  end
end
