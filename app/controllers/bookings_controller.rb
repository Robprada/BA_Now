class BookingsController < ApplicationController
  before_action :authenticate_user!
  # def index
  #   @bookings = Booking.all
  # end

  # def new
  #   @experience = Experience.find(params[:id])
  #   @booking = Booking.new
  # end
  def index
    @booked_experiences = current_user.booked_experiences
  end

  def create
    # @experince = Experience.find(params[:experience_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to root_path, notice: 'Booking created succesfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = current_user.bookings.find(params[:id])
    if @booking.destroy
      redirect_to bookings_path, notice: 'Reserva cancelada con éxito.'
    else
      redirect_to bookings_path, alert: 'Hubo un problema al cancelar la reserva.'
    end
  end

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @booking.destroy
  # end

  private

  def booking_params
    params.require(:booking).permit(:experience_id, :booking_date, :hour, :tickets)
  end
end
