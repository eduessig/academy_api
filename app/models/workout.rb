class Workout < ApplicationRecord
  has_many :workout_exercises
  belongs_to :user
  belongs_to :personal_trainer

  before_destroy :ensure_not_referenced_by_any_workout_exercise

  def ensure_not_referenced_by_any_workout_exercise
    unless workout_exercises.empty?
      errors.add(:base, "Can't delete workout with existing workout exercises")
      throw :abort
    end
  end
end
