class CreatePersonalTrainers < ActiveRecord::Migration[7.2]
  def change
    create_table :personal_trainers do |t|
      t.timestamps

      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.string :cpf, null: false
      t.date :birth_date
    end
  end
end
