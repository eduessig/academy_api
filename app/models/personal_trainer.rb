class PersonalTrainer < ApplicationRecord
  has_many :users
  has_many :workouts
  has_many :physical_reviews

  validates_presence_of :name, :email, :cpf, :birth_date
end
