class CreateExercises < ActiveRecord::Migration[7.2]
  def change
    create_table :exercises do |t|
      t.timestamps

      t.string :name, null: false
      t.integer :sets, null: false
      t.integer :repetitions, null: false
      t.string :machine
    end
  end
end
