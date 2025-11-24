class ExercisesController < ApplicationController
  before_action :set_exercise, only: [ :show, :update, :destroy ]

  def index
    @exercises = Exercise.all

    render json: @exercises
  end

  def show
    render json: @exercise
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      render json: @exercise, status: :created
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  def update
    if @exercise.update(exercise_params)
      render json: @exercise
    else
      render json: @exercise.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @exercise.destroy
      render json: { message: "Exercise deleted successfully" }
    else
      render json: { error: @exercise.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { error: "Exercise not found" }, status: :not_found
  end

  def exercise_params
    params.require(:exercise).permit(:name, :sets, :repetitions, :machine)
  end
end
