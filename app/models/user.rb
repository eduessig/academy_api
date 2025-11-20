class User < ActiveRecord::Base
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User


  belongs_to :personal_trainer
  has_many :workouts
  has_many :physical_reviews

  validates_presence_of :name, :cpf
end
