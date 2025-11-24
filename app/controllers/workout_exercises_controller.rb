class WorkoutExercisesController < ApplicationController
  before_action :set_workout_exercise, only: %i[show destroy]

  def index
    @workout_exercises = WorkoutExercise.all
    render json: @workout_exercises
  end

  def show
    render json: @workout_exercise
  end

  def destroy
    if @workout_exercise.destroy
      render json: { message: "Workout exercise deleted successfully" }
    else
      render json: @workout_exercise.errors, status: :unprocessable_entity
    end
  end

  def link_workout_to_exercise
    @workout_exercise = WorkoutExercise.new(workout_exercise_params)

    if @workout_exercise.save
      render json: @workout_exercise
    else
      render json: @workout_exercise.errors, status: :unprocessable_entity
    end
  end

  private

  def workout_exercise_params
    params.require(:workout_exercise).permit(:workout_id, :exercise_id)
  end

  def set_workout_exercise
    @workout_exercise = WorkoutExercise.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      render json: { error: "WorkoutExercise not found" }, status: :not_found
  end
end
