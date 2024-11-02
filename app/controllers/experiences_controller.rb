class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]
  def index
    @experiences = current_user.created_experiences
  end

  def show
    @booking = Booking.new
    @markers = [{ lat: @experience.latitude,
                  lng: @experience.longitude,
                  info_window_html: render_to_string(partial: "info_window", locals: { experience: @experience }) }]
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    # Asocia la experiencia solo si el usuario está identificado
    @experience.user = current_user

    if @experience.save
      redirect_to root_path, notice: '¡La experiencia fue creada exitosamente!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @experience = Experience.find(params[:id])
    return if current_user == @experience.user

    redirect_to experiences_path,
                alert: 'No tienes permiso para editar esta experiencia.'
  end

  def update
    if @experience.update(experience_params)
      redirect_to experience_path(@experience), notice: 'La experiencia fue actualizada exitosamente!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy
    redirect_to root_path, notice: 'La experiencia fue eliminada exitosamente.'
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def authorize_user!
    return if @experience.user == current_user

    redirect_to experiences_path,
                alert: 'No tienes permiso para realizar esta acción.'
  end

  def experience_params
    params.require(:experience).permit(:title, :description, :availability, :price, :address,
                                       photos: [])
  end
end
