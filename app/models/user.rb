class User < ActiveRecord::Base
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User


  belongs_to :personal_trainer
  has_many :workouts
  has_many :physical_reviews

  validates_presence_of :name, :cpf

  before_destroy :not_referenced_by_any_workout, :not_referenced_by_any_physical_review

  def not_referenced_by_any_workout
    unless workouts.empty?
      errors.add(:base, "Can't delete user with existing workouts")
      throw :abort
    end
  end

  def not_referenced_by_any_physical_review
    unless physical_reviews.empty?
      errors.add(:base, "Can't delete user with existing physical reviews")
      throw :abort
    end
  end
end
