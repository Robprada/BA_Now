class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy] # Verifica que el usuario sea el creador

  def index
    if params[:search].present?
      @experiences = Experience.where("title ILIKE ? OR description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @experiences = Experience.all
    end
  end

  def show
    @booking = Booking.new
    @experience = Experience.find(params[:id])
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
    redirect_to experiences_path, alert: 'No tienes permiso para editar esta experiencia.' unless current_user == @experience.user
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
    redirect_to experiences_path, notice: 'La experiencia fue eliminada exitosamente.'
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def authorize_user!
    redirect_to experiences_path, alert: 'No tienes permiso para realizar esta acción.' unless @experience.user == current_user
  end

  def experience_params
    params.require(:experience).permit(:title, :description, :availability, :price, :address, photos: [])
  end
end
