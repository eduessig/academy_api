class CreateWorkoutExercises < ActiveRecord::Migration[7.2]
  def change
    create_table :workout_exercises do |t|
      t.timestamps

      t.references :workout, null: false, foreign_key: :workout_id
      t.references :exercise, null: false, foreign_key: :exercise_id
    end
  end
end
