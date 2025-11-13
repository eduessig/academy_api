class Workout < ApplicationRecord
  has_many :workout_exercises
  belongs_to :user
  belongs_to :personal_trainer
end
