class PersonalTrainer < ApplicationRecord
  has_many :users
  has_many :workouts
  has_many :physical_reviews

  validates_presence_of :name, :email, :cpf, :birth_date

  before_destroy :not_referenced_by_any_user, :not_referenced_by_any_workout, :not_referenced_by_any_physical_review

  def not_referenced_by_any_user
    unless users.empty?
      errors.add(:base, "Can't delete personal trainer with existing users")
      throw :abort
    end
  end

  def not_referenced_by_any_workout
    unless workouts.empty?
      errors.add(:base, "Can't delete personal trainer with existing workouts")
      throw :abort
    end
  end

  def not_referenced_by_any_physical_review
    unless physical_reviews.empty?
      errors.add(:base, "Can't delete personal trainer with existing physical reviews")
      throw :abort
    end
  end
end
