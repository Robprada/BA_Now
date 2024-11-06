class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @created_experiences = @user.created_experiences
    @booked_experiences = @user.booked_experiences
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update!(user_params)
      redirect_to profile_path, notice: 'Perfil actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :municipality, :password, :password_confirmation)
  end
end
