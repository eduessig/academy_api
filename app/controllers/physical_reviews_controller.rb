class PhysicalReviewsController < ApplicationController
  before_action :set_physical_review, only: [ :show, :update, :destroy ]

  def index
    @physical_reviews = PhysicalReview.all

    render json: @physical_reviews
  end

  def show
    render json: @physical_review
  end

  def create
    @physical_review = PhysicalReview.new(physical_review_params)

    if @physical_review.save
      render json: @physical_review, status: :created
    else
      render json: @physical_review.errors, status: :unprocessable_entity
    end
  end

  def update
    if @physical_review.update(physical_review_params)
      render json: @physical_review
    else
      render json: @physical_review.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy
    @physical_review.destroy
    render json: { message: "Physical review deleted successfully" }
  end

  private

  def set_physical_review
    @physical_review = PhysicalReview.find(params[:id])
  end

  def physical_review_params
    params.require(:physical_review).permit(:user_id, :personal_trainer_id, :review_date, :weight, :height, :body_fat_percentage)
  end
end
