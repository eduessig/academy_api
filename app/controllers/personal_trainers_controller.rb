class PersonalTrainersController < ApplicationController
  before_action :set_personal_trainer, only: [ :show, :update, :destroy ]

  def index
    @personal_trainers = PersonalTrainer.all

    render json: @personal_trainers
  end

  def show
    render json: @personal_trainer
  end

  def create
    @personal_trainer = PersonalTrainer.new(personal_trainer_params)

    if @personal_trainer.save
      render json: @personal_trainer, status: :created
    else
      render json: @personal_trainer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @personal_trainer.update(personal_trainer_params)
      render json: @personal_trainer
    else
      render json: @personal_trainer.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy
    @personal_trainer.destroy
    render json: { message: "Personal Trainer deleted successfully" }
  end

  private

  def set_personal_trainer
    @personal_trainer = PersonalTrainer.find(params[:id])
  end

  def personal_trainer_params
    params.require(:personal_trainer).permit(:name, :email, :birth_date, :cpf)
  end
end
