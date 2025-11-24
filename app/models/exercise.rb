class Exercise < ApplicationRecord
  has_many :workout_exercises

  validates_presence_of :name, :sets, :repetitions

  before_destroy :not_referenced_by_any_workout_exercise

  def not_referenced_by_any_workout_exercise
    unless workout_exercises.empty?
      errors.add(:base, "Can't delete exercise with existing workout exercises")
      throw :abort
    end
  end
end
