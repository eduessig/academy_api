class WorkoutExercisesController < ApplicationController
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
end
