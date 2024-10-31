class ExperiencesController < ApplicationController
  def show
    @experiences = Experience.find(params[:id])
  end

  def new
    @experince = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @user =
    if @experience.save
      redirect_to root_path, notice: 'Experience was succesfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
  end

  private

  def experience_params
    params.require(:experience).permit(:title, :description, :availability, :price, :photo)
  end
end
