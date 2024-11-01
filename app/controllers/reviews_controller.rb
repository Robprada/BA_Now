class ReviewsController < ApplicationController
  before_action :set_experience, only: %i[new create]
  before_action :set_review, only: [:destroy]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.experience = @experience
    @review.user = current_user

    if @review.save
      redirect_to @experience, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to experience_path(@review.experience), status: :see_other
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comments)
  end
end
