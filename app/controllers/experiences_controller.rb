class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[show edit update]

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    # Asocia la experiencia solo si el usuario esta identificado
    @experience.user = current_user

    if @experience.save
      redirect_to root_path, notice: '¡The Experience was created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    if @experience.update(experience_params)
      redirect_to experience_path(@experience), notice: 'Experience was successfully updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title, :description, :availability, :price, :address, :photo)
  end
end
