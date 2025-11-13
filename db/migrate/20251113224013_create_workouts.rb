class CreateWorkouts < ActiveRecord::Migration[7.2]
  def change
    create_table :workouts do |t|
      t.timestamps

      t.references :user, null: false, foreign_key: :user_id
      t.references :personal_trainer, null: false, foreign_key: :personal_trainer_id

      t.string :name, null: false
      t.integer :duration
      t.integer :difficulty, null: false
    end
  end
end
